#!/usr/bin/env ruby

require 'bundler/setup'
require 's3'

if !ENV['TRAVIS_PULL_REQUEST'].nil? && ENV['TRAVIS_PULL_REQUEST'] != 'false'
  abort('Skipping structure upload for PR build')
end

path_to_structure = ARGV[0] || 'db/structure.sql'
path = File.expand_path("../../#{path_to_structure}", __FILE__)
structure = File.read(path)
branch = ENV['TRAVIS_BRANCH']

raise "Please set TRAVIS_BRANCH env var" unless branch

service = S3::Service.new(access_key_id: ENV['ARTIFACTS_KEY'],
                          secret_access_key: ENV['ARTIFACTS_SECRET'])

bucket = service.buckets.find("travis-migrations-structure-dumps")
object = bucket.objects.build("billing/#{branch}/structure.sql")
object.content = structure
object.acl = :public_read
object.save

puts "structure.sql was saved and uploaded to S3:\n#{object.url}"

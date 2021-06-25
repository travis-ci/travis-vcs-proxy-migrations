require 'spec_helper'
require 'yaml'

describe 'Rake tasks' do
  let(:config) { YAML.load(ERB.new(File.read('config/database.yml')).result) }
  let(:conn)   { ActiveRecord::Base.connection }
  let(:tables) { conn.select_values("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'") }

  let(:expected_main_tables) do
    [
      'schema_migrations',
      'ar_internal_metadata'
    ]
  end

  before { ActiveRecord::Base.establish_connection(config['test']) }
  after { ActiveRecord::Base.remove_connection }

  def run(cmd)
    system "RAILS_ENV=test bundle exec #{cmd}  > migration.log"
    expect($?.exitstatus).to eq 0
  end

  describe 'rake db:create' do
    it 'migrates the main db' do
      run 'rake db:drop db:create db:migrate'
      expect(tables.sort).to eq expected_main_tables.sort
    end
  end

  describe 'rake db:structure:load' do
    it 'loads the main schema'do
      run 'rake db:drop db:create db:structure:load'
      expect(tables.sort).to eq expected_main_tables.sort
    end
  end
end

#!/bin/bash

set -e

docker kill travis-billing-migrations || true
docker rm travis-billing-migrations || true
docker run --name travis-billing-migrations -v `pwd`:/travis-billing-migrations -dti travisci/travis-billing-migrations

sleep 10

docker exec -it travis-billing-migrations psql -U postgres -c "CREATE ROLE root WITH CREATEDB CREATEROLE LOGIN SUPERUSER"
docker exec -it travis-billing-migrations bundle install --path ./vendor
docker exec -it travis-billing-migrations bundle exec rake db:create
docker exec -it travis-billing-migrations bundle exec rake db:migrate db:structure:dump

docker kill travis-billing-migrations
docker rm travis-billing-migrations

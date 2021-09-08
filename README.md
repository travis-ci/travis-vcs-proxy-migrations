vcs-proxy-migrations
=================

Data model migrations/adjustments for Travis CI Proxy (integration with VCS other than Git)

This is a repository for storing migrations for VCS Proxy DB, and executing them against production and development databases.

In short, migrations should be run locally while standing in this repository during development.

Please use Postgresql 12.x for local development and testing, but note that production and enterprise environments require compatibility with 12.x.

Installing
----------

``` bash
git clone https://github.com/travis-infrastructure/vcs-proxy-migrations.git
```

Adding migrations
-------------------

To add a migration, run the `gen_migration` rake task. For example:

```
bundle exec rake gen_migration["add_column_x_to_table_y"]
```

This creates a new ActiveRecord migration file in `db/migrate`,
with the current timestamp and the name `add_column_x_to_table_y`:

```
      create  db/migrate/20181007154333_add_column_x_to_table_y.rb
```

See [this guide](http://edgeguides.rubyonrails.org/active_record_migrations.html#creating-a-standalone-migration) for creating standalone migrations.

Please make sure your migrations are production safe as per this guide: [Safe Operations For High Volume PostgreSQL](https://www.braintreepayments.com/blog/safe-operations-for-high-volume-postgresql/).

You can run `script/dump-schema-docker.sh` to generate the schema file
using a consistent version of postgres (running in a docker container).

Use `docker build -t travisci/vcs-proxy-migrations .` to build the image first.


Using Docker to run on PostgreSQL 12.x
-------------------------------------

We use PostgreSQL 12.x on production, which is often different than the database
installed on many operating systems by default. In order to make it easier to
run against 12.x you can use Docker with a supplied docker-compose.yml file.

Run `docker-compose up` to start the container. Then you can either change
settings in `config/database.yml` to use `postgres` as a user and `5431` as a
port, or run with `DATABASE_URL` specified explicitly, for example:

```bash
DATABASE_URL=postgres://postgres@localhost:5431/travis_vcs_proxy_test bundle exec rake db:migrate
```

Running migrations locally
--------------------------

<em>PLEASE NOTE: the `DATABASE_URL` is the url of the local database that will be created or have migrations run on it. This is configured in the `config/database.yml`. To specify an environment append `RAILS_ENV=` to each bash command, eg to create the test database use:</em>

```bash
RAILS_ENV=test bundle exec rake db:create
```

To setup the database from scratch:

``` bash
bundle exec rake db:create
```

To run migrations after the database has been set up:

``` bash
bundle exec rake db:migrate
```

When getting ActiveRecord::NoEnvironmentInSchemaError error
-----------------------------------------------------------

Since version 5.0 ActiveRecord will complain if the env info is not saved in the
database with an error:

```
ActiveRecord::NoEnvironmentInSchemaError:

Environment data not found in the schema. To resolve this issue, run:

        bin/rails db:environment:set RAILS_ENV=test
```

The command that it outputs will not work, because we don't install rails
scripts. You can run this instead:

```bash
bundle exec rake db:environment:set RAILS_ENV=test
```

You may need to change `RAILS_ENV=test` to whatever environment you're trying to
migrate.


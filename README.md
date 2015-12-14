# Storytellers

## Development Setup

### Installing Dependencies

After installing [Ruby](https://www.ruby-lang.org/en/), [Bundler](http://bundler.io/), and [Postgres](http://www.postgresql.org/), run the following from the project's root to install gem dependencies:

```shell
bundle install
```

Then, to install front-end [Bower](http://bower.io/) dependencies, run:

```shell
bower install
```

### Preparing the Database

To create, migrate, and seed a development database, run the following commands:

```shell
rake db:create
rake db:migrate
rake db:seed
```

### Starting the Server

To start the development server, run the following command:

```shell
rails s
```

Then visit [http://localhost:3000](http://localhost:3000) in a browser to view the app.

## Deployment

Ensure that the Heroku app is configured to use the [Ruby-Bower buildpack](https://github.com/qnyp/heroku-buildpack-ruby-bower.git).

After every green commit to `master`, [CircleCI](https://circleci.com/gh/SolarCS/storytellers/tree/master) will automatically deploy to Heroku and migrate the database.

The production application lives at [http://cipher-storyteller.herokuapp.com](http://cipher-storyteller.herokuapp.com).

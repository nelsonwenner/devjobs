## :information_source: Getting Started
The quickest way to make this work locally is to use Docker, see the Docker setup guide [DOCKER_SETUP_GUIDE](/docker/README.md). Otherwise, for a local configuration, you will need the requirements below.

## :electric_plug: Requirements

* [Ruby](https://www.ruby-lang.org/en/): we recommend using
  [rbenv](https://github.com/rbenv/rbenv) to install the Ruby version listed on
  the badge.
* [Yarn](https://yarnpkg.com/) 1.x: please refer to their
  [installation guide](https://classic.yarnpkg.com/en/docs/install).
* [PostgreSQL](https://www.postgresql.org/) 11 or higher.
* [Redis](https://redis.io/) 4 or higher.

## :man_dancing: Get it running
First, you need to create the database user the app will use by manually typing the following in your terminal:

```bash
$ sudo -u postgres psql -c "CREATE USER root WITH SUPERUSER CREATEDB PASSWORD 'root@123'"
```

This will create the "root" user as superuser and allowing it to create databases. 

Once done, run script/setup. If the script succeeds you're ready to start developing. If not, take a look at the output as it should be informative enough to help you troubleshoot.

```bash
$ script/setup
```

Now, your dreams of spinning up a development server can be realised:

```bash
$ bundle exec rails server -p 3333
```
Here are some singleton commands you may need, usually in a separate instance/tab of your shell. Running the task's Sidekiq server mainly for email notifications.

```bash
$ bundle exec sidekiq
```

Go to [http://localhost:3333](http://localhost:3333) to play around!

## :toolbox: Testing
Tests, both unit and integration, are based on RSpec. To run the test suite. Then the main application tests can be run with:

```bash
$ bundle exec rspec
```
---

musician\_analytics\_app
======================

This Rails app is meant to be a quick deploy to Heroku to start gathering free daily stats about your band. Setup is real easy.

If you don't want to use Heroku, then...

...wait, why don't you? It's easy, dummy.

"It's easy, dummy."
-------------------

First, clone this repo:

    git clone git@github.com:dbalatero/musician_analytics_app.git

Create a Heroku app.

    heroku create

Push the app to Heroku and migrate the db.

    git push heroku master
    heroku rake db:migrate

Setup your config variables.

    heroku config:add LASTFM_API_KEY="57493a46a...myapikeyhere"
    heroku config:add LASTFM_ARTIST_NAME="Operation ID"
    heroku config:add TWITTER_USERNAME="operationid"
    heroku config:add MYSPACE_USERNAME="operationid"

Enable free daily cron.

    heroku addons:add cron:daily

Navigate to your new Heroku site, and create the shared admin account for your band.

    http://my-goofy-subdomain.heroku.com

Gather one data point, to test:

    heroku rake cron

*Finally*, watch this repository and subscribe via RSS so you can get new updates. Also, follow [@operationid](http://twitter.com/operationid) on Twitter for updates, if you prefer that over RSS.

Todo
----

* Make gathering stats on each service optional.
* Make the stats page not look like dookie. Use Google Graphs?
* Gather more interesting stats?

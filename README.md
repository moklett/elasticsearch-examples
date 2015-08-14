Elastic Search Examples
=======================

This repo was accompaniment to some slides I presented at a @chargify Lunch &
Learn on our upcoming use of Elasticsearch and the elasticsearch-persistence
gem.

It demonstrates the use of the Repository model and the use of different
mappings.  I ingested all of my tweets into a local Elasticsearch instance
to show some search queries in real time.

The Slides
----------

<https://docs.google.com/a/chargify.com/presentation/d/1av_41F5R84zuQ9RBkNKqNLtKHhm6AuBVlael0bXHpzs/edit?usp=sharing>

(Only available to @chargify team members)

The rake tasks
--------------

### Clear/reset my elasticsearch database:

```
rake db:elasticsearch:reset
```

### Store my tweets in a local json file (`db/tweets.json`):

```
rake tweets:refresh
```

### Ingest `tweets.json` to elasticsearch (under 2 different indexes):

```
rake db:elasticsearch:ingest
```

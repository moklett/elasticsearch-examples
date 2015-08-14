Elastic Search Examples
=======================

This repo was accompaniment to some slides I presented at a @chargify Lunch & Learn on our upcoming use of [elasticsearch](https://www.elastic.co/products/elasticsearch) and the [elasticsearch-persistence](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-persistence) gem.

It demonstrates the use of the [Repository pattern](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-persistence#the-repository-pattern) and the use of different mappings.  I ingested all of [my tweets](https://twitter.com/moklett) into a local elasticsearch instance to show some search queries in real time.

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

class TweetV1Repository
  include Elasticsearch::Persistence::Repository
  index :tweets_v1
  type :tweet
  klass Tweet
end

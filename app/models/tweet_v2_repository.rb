class TweetV2Repository
  include Elasticsearch::Persistence::Repository
  index :tweets_v2
  type :tweet
  klass Tweet

  mapping do
    indexes :created_at, type: :date
    indexes :id,         type: :long
    indexes :text,       type: :string, analyzer: "whitespace"
  end

  def serialize(tweet)
    hash = tweet.to_hash
    hash.merge(created_at: Time.parse(hash[:created_at]).utc.as_json)
  end
end

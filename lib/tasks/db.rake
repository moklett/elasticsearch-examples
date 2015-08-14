namespace :db do
  namespace :elasticsearch do
    # Delete and recreate elasticsearch indicies
    task reset: :environment do
      [TweetV1Repository, TweetV2Repository].each do |repo|
        repo.create_index!(force: true)
      end
    end

    # Ingest db/tweets.json into all elasticsearch indicies
    task ingest: :reset do
      tweets = JSON.parse(File.read(Rails.root.join("db/tweets.json")))
      tweets.each do |data|
        tweet = Tweet.new(data)
        TweetV1Repository.save(tweet)
        TweetV2Repository.save(tweet)
      end
    end
  end
end

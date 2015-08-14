namespace :tweets do
  desc "Fetch all tweets for @moklett and persist to db/tweets.json.gz"
  task :refresh do
    client = TwitterClient.client
    def collect_with_max_id(collection=[], max_id=nil, &block)
      response = yield(max_id)
      collection += response
      response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
    end

    def client.get_all_tweets(user)
      collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        user_timeline(user, options)
      end
    end

    tweets = client.get_all_tweets("moklett")

    tweets_f   = Rails.root.join("db/tweets.json").to_s
    gztweets_f = Rails.root.join("db/tweets.json.gz").to_s
    File.open(tweets_f, "w") {|f| f << JSON.pretty_generate(tweets.as_json) }
    Zlib::GzipWriter.open(gztweets_f) do |gz|
      gz.mtime = File.mtime(tweets_f)
      gz.orig_name = tweets_f
      gz.write IO.binread(tweets_f)
    end
    File.unlink(tweets_f)
  end
end

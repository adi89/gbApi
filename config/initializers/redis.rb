uri = ENV["REDIS_PROVIDER"] || "redis://localhost:6379/"
REDIS = Redis.new(:url => uri)
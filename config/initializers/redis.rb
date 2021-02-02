if Rails.env.production?
  Redis.current = Redis.new(url: ENV["REDIS_URL"])
else
  Redis.current = Redis.new(url: ENV["REDIS_URL"], db: 1)
end

if Rails.env.production?
  Redis.current = Redis.new(
    url: ApplicationConfig["REDIS_URL"], 
    network_timeout: 5
  )
else
  Redis.current = Redis.new(
    url: ApplicationConfig["REDIS_URL"], 
    network_timeout: 5, 
    db: 1
  )
end

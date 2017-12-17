$redis = Redis.new(host: '127.0.0.1', port: 6379, password: ENV['REDIS_KEY'])

heartbeat_thread = Thread.new do
  while true
    $redis.publish("heartbeat","thump")
    sleep 15.seconds
  end
end

at_exit do
  heartbeat_thread.kill
  $redis.quit
end
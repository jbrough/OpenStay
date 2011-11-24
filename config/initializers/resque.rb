if ENV['VCAP_SERVICES'].nil?
  if Rails.env == 'development'
  	Resque.redis = Redis.new
  end
else
  vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
  redis = vcap_services.detect { |k,v| k =~ /redis/ }.last.first
  redis_host      = redis["credentials"]["hostname"]
  redis_port      = redis["credentials"]["port"]
  redis_password  = redis["credentials"]["password"]
  Resque.redis = Redis.new( :host => redis_host, :port => redis_port, :password => redis_password)
end

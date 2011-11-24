if ENV['VCAP_SERVICES'].nil?
  if Rails.env == 'development'
  
  end
else
  vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
  mongo = vcap_services.detect { |k,v| k =~ /mongo/ }.last.first["credentials"]
  host      = mongo["hostname"]
  port      = mongo["port"]
  user      = mongo["username"]
  pass      = mongo["password"]
  db        = mongo["db"]
  Mongoid.configure do |config|
    config.master = Mongo::Connection.new(host, port).db(db)
    config.master.authenticate(user, pass)
    config.allow_dynamic_fields = false
  end
end

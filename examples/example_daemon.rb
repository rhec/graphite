#!/usr/bin/env ruby
ENV["RAILS_ENV"] ||= "production"
require File.dirname(__FILE__) + "/../../config/environment"

Thread.abort_on_exception = true
EM.threadpool_size = 1

Graphite::Client.new(GRAPHITE_SERVER, "yourapp.#{Rails.env}.global") do |graphite|

  REPLICATION_SECONDS_BEHIND_OID = '.1.3.6.1.4.1.8072.1.3.2.4.1.2.11.115.108.97.118.101.83.116.97.116.117.115.6'

  graphite.metric "health.database.slave_seconds_behind", 5.minutes do
    `/usr/bin/snmpget -v2c -c oibsnmp db.example.com #{REPLICATION_SECONDS_BEHIND_OID}`.split.last.to_f
  end

  graphite.metric "users.new_past_week", 15.minutes do
    User.count(:conditions => ["created_at >= '?'",7.days.ago])
  end

  graphite.metric "users.new_past_day", 15.minutes do
    User.count(:conditions => ["created_at >= '?'",1.day.ago])
  end

  graphite.metric "users.new_past_hour", 1.minutes, :shifts => ['24h', '7d', '30d','90d'] do
    User.count(:conditions => ["created_at >= '?'",1.hour.ago])
  end

  graphite.metric "users.active", 5.minutes, :shifts => ['24h','7d','30d','90d'] do
    User.count(:conditions => "active = 1")
  end

  graphite.metric "users.inactive", 5.minutes do
    User.count(:conditions => "active = 0")
  end
    
end

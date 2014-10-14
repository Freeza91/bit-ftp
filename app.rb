#encoding: gbk

require 'sinatra'
require 'rufus-scheduler'
require 'active_support/all'
require './bit_ftp_v2.rb' #使用手动添加cookie
#require './bit_ftp_v1.rb' #使用联盟开放API，但因暂未开放更新帖子API无法继续开发

#include V1 #V1
include V2 #v2

Time.zone = "Beijing"
T = Time.now + 365 * 24 * 3600
times = 0

s = Rufus::Scheduler.new
s.every "10m", :first_time => Time.now + 60, :last_at => T do 
  t = Time.now
  if t.hour >= 0 and t.hour <= 8
    # do nothing, becsuce at the time nobody can awake!
  elsif t.hour > 8 and t.hour < 12
    times += 1
    if times > 5
      get_index
      times = 0
    end
  elsif t.hour >= 12 and t.hour < 13
    times += 1
    if times > 2
      get_index
      times = 0
    end
  elsif t.hour >= 13 and t.hour < 19
    times += 1
    if times > 5
      get_index
      times = 0
    end
  elsif t.hour >= 19 and t.hour < 24
    times += 1
    if times > 1
      get_index
      times = 0
    end
  end
end

get '/' do 
  Time.now
end

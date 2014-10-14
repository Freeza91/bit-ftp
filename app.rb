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

s = Rufus::Scheduler.new
s.every "58m", :first_time => Time.now, :last_at => T do 
  t = Time.now
  if t.hour >= 0 and t.hour < 8
    # do nothing, becsuce at the time nobody can awake!
  else 
    get_index
  end
end

get '/' do 
  Time.now
end

#encoding: gbk

require 'sinatra'
require 'rufus-scheduler'
#require './bit_ftp_v2.rb' #使用手动添加cookie
#require './bit_ftp_v1.rb' #使用联盟开放API，但因暂未开放更新帖子API无法继续开发

#include V1 #V1
#include V2 #v2

s = Rufus::Scheduler.new
s.every "60s" do 
   get_index
end


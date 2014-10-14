#encoding: gbk
require 'net/http'
require 'yaml'
require 'uri'
require 'nokogiri'

Setting = YAML::load_file('./setting.yaml')

module V2

  def login
    #cookie for one year!
  end

  def get_index
    uri = URI Setting["index_home"]  
    req = Net::HTTP::Get.new(uri)
    req['Cookie'] = Setting['Cookie']
    req['User-Agent'] = Setting['User-Agent']
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request req
    end
=begin
    #未对这个进行测试，因为我还未找到合适的帖子！
    emeny_num = Analy req.body
    friend_num = Setting['topic']['friend'].count
    union_num = 0
    if friend_num >= emeny_num 
      union_num = 0
    else 
      union_num = emeny_num - friend_num
    end
    fight_emeny_by_union union_num
    friend_flag friend_num
=end
    friend_flag 1
  end

  def Analy body
    emeny = Setting['topic']['enemy_url']
    num = 10
    doc = Nokogiri::HTML(body, nil, "GB2312")
    
    doc.css('table').each do |tab|
      if tab['cellspacing'] == "1" and tab['cellpadding'] == "4" and tab['width'] == "100%" and tab['border'] == "0"
        tr = tab.css('tr')
        if tr.count == 12
          2.upto(tr.count-1) do |i|
            td = tr[i].css('td')
            a = td.first.css('div').css('a') 
            if emeny.include? a.last['href']
              num = 12 - i                    #需要顶贴的最大数
              return num
            end
          end
        end
      end
    end
    return num
  end

  def fight_emeny_by_union num
    num.times do |i|
      post_message Setting['topic']['union'][i]
    end
  end

  def friend_flag num
    num.times do |i|
      post_message Setting['topic']['friend'][i]
    end
  end

  def post_message hash
    sleep(10)
    uri = URI Setting['post_index']

    req = Net::HTTP::Post.new(uri, initheader = {'Cookie' => Setting['Cookie'],"User-Agent" => Setting['User-Agent'], "Content-Type" => Setting['Content-Type']})
    req.body = "editsubmit=submit&page=#{hash['page']}" + 
               "&message=#{hash['message']}" + 
               "&fid=#{hash['fid']}" + 
               "&tid=#{hash['tid']}" + 
               "&pid=#{hash['pid']}&editpost=编辑帖子"
    
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end
end


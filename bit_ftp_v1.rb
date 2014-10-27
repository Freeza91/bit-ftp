require 'rufus-scheduler'
require 'net/http'
require 'uri'
require 'json'

module Helpers 
  @hello = "hello" 
  USERNAME = "xxxxx"
  PASSWORD = "xxxxx"
  ACTION = "login"

  def start
    login
    s = Rufus::Scheduler.new
    s.every "5s" do 
    end
  end

  def login
    uri = URI('http://www.bitunion.org/open_api/bu_logging.php')
    res = Net::HTTP.post_form(uri, 'action' => ACTION, 
                              'username' => USERNAME, 'password' => PASSWORD)
    puts res.body.to_json
  end

end



require 'outpost'
require 'outpost/scouts'

module Outposts
  class Call4paperz < Outpost::Application

    using Outpost::Scouts::Http => 'http response from call 4 paperz' do
      options :host => 'call4paperz.com'

      report :up, :response_body => {:match => /Keep track of your call for proposals/}
      report :down, :response_body => {:match => /Ouch! Something wrong has happened/}
    end

    using Outpost::Scouts::Ping => 'ping response from call 4 paperz' do
      options :host => 'call4paperz.com'

      report :up, :response_time => {:less_than => 5000}
    end
  end
end

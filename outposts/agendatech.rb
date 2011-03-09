require 'outpost'
require 'outpost/scouts'

module Outposts
  class Agendatech < Outpost::Application

    using Outpost::Scouts::Http => 'http response from agendatech' do
      options :host => 'agendatech.com.br'
      report :up, :response_body => {:match => /Eventos de tecnologia no Brasil/}
      report :up, :response_code => 200
      report :down, :response_code => [500, 503]
    end

    using Outpost::Scouts::Ping => 'ping response from agendatech' do
      options :host => 'agendatech.com.br'
      report :up, :response_time => {:less_than => 5000}
    end
  end
end


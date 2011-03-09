require 'sinatra'
require 'haml'

require 'outposts/call4paperz'
require 'outposts/agendatech'

get '/' do
  @statuses = []
  @statuses << {:site => 'Call 4 paperz', :status => Outposts::Call4paperz.new.run.to_s}
  @statuses << {:site => 'Agendatech', :status => Outposts::Agendatech.new.run.to_s}

  haml :index
end

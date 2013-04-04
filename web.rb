require 'sinatra'
require 'erb'
require 'nokogiri'
require 'open-uri'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  parser = Parser.new
  @remaining = parser.getRemainingTickets(open("http://agilethailand2013.eventbrite.com/"))

  erb :index
end

class Parser
    def getRemainingTickets(content) 
        doc = Nokogiri::HTML(content)

        ticketNodes = doc.css("#ticket_table .ticket_row td:nth-child(2)")
        firstTicketNode = ticketNodes[0]

        retVal = firstTicketNode.content.split(" ")[0]
        return retVal
    end
end

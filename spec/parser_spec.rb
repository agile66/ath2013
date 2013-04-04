require File.join(File.dirname(__FILE__), '../web')


describe 'parser' do
    specify 'should find the correct tickets number' do
        parser = Parser.new

        f = File.open(File.join(File.dirname(__FILE__), "ath2013_eb_sample.html"))
        content = f.read

        remainingTickets = parser.getRemainingTickets(content)

        remainingTickets.should eql("227")
            
        f.close
    end
end
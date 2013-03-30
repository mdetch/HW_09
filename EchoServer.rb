require 'socket'

def run(client,n)
	puts "New Communication Thread Started"
	while 
		inmsg = client.gets
		puts "Client##{n} says:"+inmsg
		ex = "Bye."
		if ex.eql?(inmsg.chomp)
			puts "Client##{n} has left."
			client.close
		else
			client.puts inmsg
		end
	end	
end
	
server = nil
server = TCPServer.new "127.0.0.1",11111
puts "Connection Socket Created"
n = 0
loop do
	puts "Waiting for Connection"
	client = server.accept
	Thread.new{run client,n}
	n = n+1
end


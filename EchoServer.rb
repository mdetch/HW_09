require 'socket'

def run(client,n)
	puts "New Communication Thread Started"
	while 
		inmsg = client.gets
		puts "Client##{n} says:"+inmsg
		if (inmsg!="Bye.")
			puts "Client##{n} has left."
			client.puts"Bye bye !"
			client.close
		else
			client.puts inmsg
		end
	end	
end
	
server = nil
begin
	server = TCPServer.new "127.0.0.1",11111
	puts "Connection Socket Created"
	n = 0
	begin
		loop do
			puts "Waiting for Connection"
			client = server.accept
			Thread.new{run client,n}
			n = n+1
		end
	rescue	Exception => e
		puts "Accept failed."
		exit
	end
rescue	Exception => e
	puts "Could not listen on port: 11111."
	exit
ensure
	begin
		server.close
		exit
	rescue Exception => e
		puts "Could not close port: 11111."
		exit
	end
end

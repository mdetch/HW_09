require 'socket'

s = TCPSocket.new "127.0.0.1", 11111

puts "Type Message (\"Bye.\" to quit)"

while
	STDOUT.flush  
	message = gets.chomp 
	s.puts message

	if message=="Bye."
		exit
	end

	replymsg = s.gets
	puts "echo: "+replymsg
end

s.close  
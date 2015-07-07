require 'socket'

qotd = TCPServer.new 17

loop do
	Thread.start(server.accept) do |client|
		client.puts "here is a quote for you"
		client.puts "- me"
		client.close
end
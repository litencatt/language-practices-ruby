require 'socket'

s = TCPServer.open(20000)

puts "Start server"
loop do
  socket = s.accept

  while str = socket.gets.chomp
    puts "RECV : #{str}"

    socket.puts "Server received '#{str} from client'"
  end

  socket.close
end

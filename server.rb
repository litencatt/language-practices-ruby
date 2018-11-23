require 'socket'

puts "Start server"
s = TCPServer.open(20000)

loop do
  socket = s.accept
  puts "accept #{socket.peeraddr}"

  while buf = socket.gets
    puts buf
  end

  puts "close socket"
  socket.close
end

s.close

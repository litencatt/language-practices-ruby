require 'socket'

puts "Start server"
s = TCPServer.open(20000)

loop do
  Thread.start(s.accept) do |socket|
    puts "accept #{socket.peeraddr}"
    p socket.peeraddr

    while buf = socket.gets
      puts buf
    end

    puts "close socket"
    socket.close
  end
end

s.close

require 'socket'

puts "Start server"
s = TCPServer.open(20000)

loop do
  Thread.start(s.accept) do |socket|
    # puts "accept #{socket.peeraddr}"
    port = socket.peeraddr[1]

    while buf = socket.gets
      buf = "#{Time.now}\n#{port}: #{buf}"
      puts buf
    end

    puts "close socket"
    socket.close
  end
end

s.close

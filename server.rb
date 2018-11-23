require 'socket'

puts "Start server"
s = TCPServer.open(20000)

loop do
  Thread.start(s.accept) do |socket|
    # puts "accept #{socket.peeraddr}"
    port = socket.peeraddr[1]

    while buf = socket.gets
      puts "#{Time.now} #{port}: #{buf}"
    end

    puts "close #{port} socket"
    socket.close
  end
end

s.close

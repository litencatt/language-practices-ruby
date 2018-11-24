require 'socket'

def message_repeat(socket)
  loop do
    socket.puts %w(yes no agree disagree).sample
    sleep(Random.rand(1..5))
  end

  puts "socket close"
  socket.close
end

def create_threads(num)
  sockets = []
  0.upto(num - 1) do
    sockets << TCPSocket.open("localhost", 20000)
  end

  sockets.each_with_object([]) do |socket, arr|
    arr << Thread.new { message_repeat(sockets[0]) }
  end
end

create_threads(5).each{|thr| thr.join}

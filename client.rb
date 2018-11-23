require 'socket'

socket = TCPSocket.open("localhost", 20000)

loop do
  socket.puts %w(yes no agree disagree).sample
  sleep(5)
end

socket.close

require 'socket'

sock = TCPSocket.open("localhost", 20000)

while line = $stdin.gets
  sock.puts line
  sock.flush

  puts sock.gets
end

sock.close

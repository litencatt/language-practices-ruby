require 'socket'

sock = TCPSocket.open("localhost", 20000)

while buf = $stdin.gets
  sock.puts buf
  sock.flush
end

sock.close

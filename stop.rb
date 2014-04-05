require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:1234'
device :sphero, :driver => :sphero

work do
  sphero.stop
end
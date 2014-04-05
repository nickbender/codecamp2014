require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:1234'
device :sphero, :driver => :sphero

work do
  @count = 1
  every(3.seconds) do
    sphero.set_color(@count % 2 == 0 ? :green : :blue)
    @count += 1
    sphero.roll 60, rand(360)
  end
end
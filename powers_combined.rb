require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:1234'
device :sphero, :driver => :sphero

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.4

work do
  init_settings

  on joystick, :joystick => proc { |caller, value|
    if in_range?(value) 
      #puts value.inspect
      sphero.stop
      @rolling = false
    elsif value[:s] == 0
      puts value.inspect
      @heading = heading(value)
      puts "#{@heading} degrees"
      sphero.roll 300, @heading
      @rolling = true
    end
  }
end

def init_settings
  #sphero.stop
  sphero.set_color(255,255,255)
  @heading = 0
  @rolling = false
end

def in_range?(value)
  value[:x].between?(-5000,5000) && value[:y].between?(-5000,5000)
end

def heading(value)
  (180.0 - (Math.atan2(value[:y],value[:x]) * (180.0 / 3.14))).round
end
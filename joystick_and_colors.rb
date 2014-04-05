require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:1234'
device :sphero, :driver => :sphero

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.1

work do
  on joystick, :button_triangle => proc { |*value|
    puts "BLUE!"
    sphero.set_color(0,0,255)
  }
  on joystick, :button_square => proc { |*value|
    puts 'SQUARE MEANS RED!'
    sphero.set_color(255,0,0)
  }
  on joystick, :button_x => proc { |*value|
    puts 'X MEANS GREEN!'
    sphero.set_color(0,255,0)
  }
  on joystick, :button_circle => proc { |*value|
    puts 'circle button'
    sphero.set_color(255,255,255)
  }
  on joystick, :button_l1 => proc { |*value|
    puts 'L1 button'
  }
  on joystick, :button_l2 => proc { |*value|
    puts 'L2 button'
  }
  on joystick, :button_r1 => proc { |*value|
    puts 'R1 button'
  }
  on joystick, :button_r2 => proc { |*value|
    puts 'R2 button'
  }
  on joystick, :button_start => proc { |*value|
    puts 'start button'
  }
  on joystick, :button_start => proc { |*value|
    puts 'select button'
  }
end
require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4567'
device :sphero, :driver => :sphero

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.01

work do
  init_settings

  on joystick, :joystick => proc { |caller, value|
    if in_range?(value)
      sphero.stop
      @rolling = false
    else
      @heading = heading(value)
      sphero.roll 20, @heading
      @rolling = true
    end
  }
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

def init_settings
  sphero.stop
  sphero.set_color(255,255,255)
  @heading = 0
  @rolling = false
end

def in_range?(value)
  value[:x].between?(-5000,5000) && value[:y].between?(-5000,5000)
end

def heading(value)
  (180.0 - (Math.atan2(value[:y],value[:x]) * (180.0 / Math::PI))).round
end
require 'artoo'

connection :joystick, :adaptor => :joystick
device :joystick, :driver => :ps3, :connection => :joystick, :interval => 0.1

work do
  on joystick, :joystick => proc { |caller, value|
    puts 'joystick ' + value[:s].to_s, value[:x], value[:y]
  }
  on joystick, :button_triangle => proc { |*value|
    puts 'triangle button'
  }
  on joystick, :button_square => proc { |*value|
    puts 'square button'
  }
  on joystick, :button_x => proc { |*value|
    puts 'x button'
  }
  on joystick, :button_circle => proc { |*value|
    puts 'circle button'
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
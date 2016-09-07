class InstanceVariablesVsLocalVariables
  attr_accessor :time

  def initialize
    self.time = Time.now
    print_time
  end

  def set_time_local
    time = Time.now
  end

  def set_time_instance
    self.time = Time.now
  end

  def print_time
    puts "The time is #{time}."
  end
end

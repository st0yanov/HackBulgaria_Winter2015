# Task: Implement Object#singleton_class
# My Solution:

class Object
  def singleton_class
    class << self
      self
    end
  end
end

p Object.new.singleton_class
p Object.new.singleton_class

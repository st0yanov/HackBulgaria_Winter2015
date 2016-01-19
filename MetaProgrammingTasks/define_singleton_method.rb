require_relative 'singleton_class'

class Object
  def define_singleton_method(name, method = nil, &block)
    if method.nil?
      singleton_class.send(:define_method, name, &block)
    else
      singleton_class.send(:define_method, name, method)
    end
  end
end

a = Object.new
a.define_singleton_method(:hello) { "#{self}: Hello there!" }
p a.hello

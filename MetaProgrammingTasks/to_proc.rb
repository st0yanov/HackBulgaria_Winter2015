class String
  def to_proc
    proc { |obj, args| obj.send(self, *args) }
  end
end

p [1, 2, 3].inject(&'+')

class String
  def to_proc
    proc do |obj, args|
      multi = self.split('.')
      multi.each do |method|
        obj = obj.send(method, *args)
      end
      obj
    end
  end
end

p [2, 3, 4, 5].map(&'succ.succ.succ.pred.pred.pred')

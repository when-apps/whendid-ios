class Timer < CDQManagedObject
  def self.create(opts=nil)
    options = opts || {}
    new options.merge({:happenedAt => Time.now})
  end
end

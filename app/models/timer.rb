class Timer < CDQManagedObject
  def distance_in_seconds
    Time.now - self.happened_at
  end

  def distance_in_human_speak
    seconds = distance_in_seconds

    values = [
      [60, :seconds],
      [60, :minutes],
      [24, :hours],
      [365, :days],
      [100, :years]
    ].map do |count, name|
      if seconds > 0
        seconds, n = seconds.divmod(count)
        "#{n.to_i} #{name}"
      end
    end.compact.reverse

    if values.size > 1
      values[0..-2]
    else
      values
    end.join(" ")
  end
end

class TimersScreen < PM::TableScreen
  title "When did"

  def on_load
    set_nav_bar_button :right, system_icon: :add, action: :add_timer

    start_counter
  end

  def table_data
    [{
      :cells => Timer.sort_by(:happened_at, order: :descending).map do |timer|
        {
          :title     => timer.name,
          :subtitle  => "#{humanize_time_in_seconds(Time.now - timer.happened_at)} ago",
          :action    => :edit_timer,
          :arguments => {:timer => timer}
        }
      end
    }]
  end

  def add_timer
    open AddTimerScreen
  end

  def edit_timer(args={})
    open EditTimerScreen.new(args)
  end

  def view_will_appear(animated)
    update_table_data
  end

  def start_counter
    @counter ||= NSTimer.scheduledTimerWithTimeInterval(1,
      target: self,
      selector: "update_table_data",
      userInfo: nil,
      repeats:  true
    )
  end

  def humanize_time_in_seconds(seconds)
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

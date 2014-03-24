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
          :subtitle  => timer.distance_in_human_speak,
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
end

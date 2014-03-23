class TimersScreen < PM::TableScreen
  title "When did"

  def on_load
    set_nav_bar_button :right, system_icon: :add, action: :add_timer

    start_counter
  end

  def table_data
    [{
      :cells => Timer.all.map do |timer|
        {
          :title       => timer.name,
          :subtitle => "#{(Time.now - timer.happenedAt).to_i} seconds ago"
        }
      end
    }]
  end

  def add_timer
    open AddTimerScreen
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

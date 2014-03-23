class AddTimerScreen < PM::FormotionScreen
  title ""

  def on_submit(_form)
    formValues = _form.render
    name = formValues[:name]
    happened_at = Time.at(formValues[:start_time])

    if name && name != ""
      Timer.create(:name => name, :happened_at => happened_at)
      cdq.save
    end

    close_screen
  end

  def table_data
    {
      :sections => [{
        :title => nil,
        :key   => :primary_values,
        :rows  => [{
          :key                 => :name,
          :placeholder         => "I learn to drive?",
          :type                => :string,
          :auto_capitalization => :none
        }, {
          :key    => :start_time,
          :value  => NSDate.alloc.init.timeIntervalSince1970.to_i,
          :type   => :date,
          :picker_mode => :date_time
        }, {
          :title => "Start",
          :type  => :submit
        }]
      }]
    }
  end
end

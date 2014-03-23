class AddTimerScreen < PM::FormotionScreen
  title "When did"

  def on_submit(_form)
    formValues = _form.render
    name = formValues[:name]
    happenedAt = Time.at(formValues[:start_time])

    if name && name != ""
      Timer.create(:name => name, :happenedAt => happenedAt)
      cdq.save
    end

    close_screen
  end

  def table_data
    {
      :sections => [{
        :title => "When did",
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
        }]
      }, {
        :rows => [{
          :title => "Start",
          :type  => :submit
        }]
      }]
    }
  end
end

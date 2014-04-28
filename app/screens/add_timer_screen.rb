class AddTimerScreen < PM::FormotionScreen
  title ""

  def on_submit(_form)
    formValues  = _form.render
    name        = formValues[:name]
    happened_at = Time.at(formValues[:start_time])
    image       = formValues[:image].nsdata

    if name && name != ""
      Timer.create(:name => name, :happened_at => happened_at, :image => image)
      cdq.save

      close_screen
    else
      App.alert "Please enter a name", {
        :cancel_button_title => "Ok"
      }
    end
  end

  def table_data
    {
      :sections => [{
        :title => nil,
        :key   => :primary_values,
        :rows  => [{
          :key         => :name,
          :placeholder => "I learn to drive?",
          :type        => :string
        }, {
          :key       => :image,
          :type      => :image,
          :image     => "camera",
          :deletable => true
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

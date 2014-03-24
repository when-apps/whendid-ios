class DeleteTimerScreen < PM::FormotionScreen
  title "Delete"

  attr_accessor :timer

  def on_submit(_form)
    formValues = _form.render

    if formValues[:name].strip == timer.name.strip
      timer.destroy
      cdq.save
      open_root_screen TimersScreen.new(nav_bar: true)
    else
      App.alert "Name does not match, try again", {
        :cancel_button_title => "Ok"
      }
    end
  end

  def table_data
    {
      :sections => [{
        :title => "Re-enter name to confirm",
        :rows  => [{
          :key                 => :name,
          :placeholder         => timer.name,
          :type                => :string
        }, {
          :title => "Confirm Delete",
          :type  => :submit
        }]
      }]
    }
  end
end

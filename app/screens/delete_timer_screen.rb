class DeleteTimerScreen < PM::FormotionScreen
  title "Delete Timer"

  attr_accessor :timer

  def on_submit(_form)
    formValues = _form.render

    if formValues[:name] == timer.name
      timer.destroy
      cdq.save
      open_root_screen TimersScreen.new(nav_bar: true)
    else
      close_nav_screen
    end
  end

  def table_data
    {
      :sections => [{
        :title => "Re-enter timer name to delete",
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

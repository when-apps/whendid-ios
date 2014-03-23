class EditTimerScreen < PM::FormotionScreen
  title ""

  attr_accessor :timer

  def on_submit(_form)
    formValues = _form.render
    timer.name = formValues[:name]
    cdq.save

    close_screen
  end

  def table_data
    {
      :sections => [{
        :title => nil,
        :key   => :primary_values,
        :rows  => [{
          :key   => :name,
          :type  => :string,
          :value => timer.name
        }, {
          :title => "Save",
          :type  => :submit
        }]
      }]
    }
  end
end

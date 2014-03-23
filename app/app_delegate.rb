class AppDelegate < PM::Delegate
  def on_load(app, options)
    open TimersScreen.new(nav_bar: true)
  end
end

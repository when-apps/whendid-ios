class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.makeKeyAndVisible
    window.rootViewController = navigation_controller
  end

  def window
    @window ||= \
      UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def timers_controller
    @timers_controller ||= \
      TimersController.alloc.initWithNibName(nil, bundle: nil)
  end

  def navigation_controller
    @navigation_controller ||= \
      UINavigationController.alloc.initWithRootViewController(timers_controller)
  end
end

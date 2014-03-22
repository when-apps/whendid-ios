class AppDelegate
  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup
    window.makeKeyAndVisible
    window.rootViewController = navigationController
  end

  def window
    @window ||= \
      UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def timersController
    @timersController ||= \
      TimersController.alloc.initWithNibName(nil, bundle: nil)
  end

  def navigationController
    @navigationController ||= \
      UINavigationController.alloc.initWithRootViewController(timersController)
  end
end

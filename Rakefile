# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project/template/ios"

begin
  require "bundler"
  Bundler.require
rescue LoadError
end

require "guard/motion"

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = "When did"
  app.identifier = "com.when-apps.whendid"
  app.icons = ["Icon-60.png", "Icon-60@2x.png"]
  app.prerendered_icon = true
  app.device_family = [:iphone]
  app.provisioning_profile = "/Users/jonmagic/Library/MobileDevice/Provisioning Profiles/whenapps.mobileprovision"
end

task :"build:simulator" => :"schema:build"

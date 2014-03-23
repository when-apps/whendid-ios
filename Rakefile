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
  app.icons = ["Icon.png", "Icon@2x.png"]
  app.prerendered_icon = true
end

task :"build:simulator" => :"schema:build"

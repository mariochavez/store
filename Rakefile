#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Store::Application.load_tasks

begin
  require 'cane/rake_task'

  desc "Run cane to check quality metrics"
  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_max = 10
    #cane.add_threshold 'coverage/covered_percent', :>=, 99
    #cane.no_style = true
    #cane.abc_exclude = %w(Foo)
  end

rescue LoadError
  warn "cane not available, quality task not provided."
end

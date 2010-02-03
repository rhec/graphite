# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{graphite}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ian Ragsdale", "Mike Subelsky"]
  s.date = %q{2010-02-03}
  s.description = %q{Ruby client for sending stats to Graphite}
  s.email = %q{mike@capitalthought.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "HISTORY.rdoc",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO.txt",
     "VERSION",
     "examples/example_daemon.rb",
     "lib/graphite.rb",
     "lib/graphite/client.rb",
     "lib/graphite/event_machine_handler.rb",
     "lib/graphite/logger.rb",
     "test/helper.rb",
     "test/test_graphite.rb"
  ]
  s.homepage = %q{http://github.com/otherinbox/graphite}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby client for sending stats to Graphite}
  s.test_files = [
    "test/helper.rb",
     "test/test_graphite.rb",
     "examples/example_daemon.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
      s.add_runtime_dependency(%q<rufus-scheduler>, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0"])
      s.add_dependency(%q<rufus-scheduler>, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0"])
    s.add_dependency(%q<rufus-scheduler>, [">= 0"])
  end
end


# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "powder"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Nash", "Adam Rogers"]
  s.date = "2011-11-02"
  s.description = "Makes Pow even easier. I mean really, really, ridiculously easy."
  s.email = ["no"]
  s.executables = ["powder"]
  s.files = ["bin/powder"]
  s.homepage = "http://github.com/Rodreegez/powder"
  s.require_paths = ["lib"]
  s.rubyforge_project = "powder"
  s.rubygems_version = "1.8.11"
  s.summary = "Makes Pow even easier"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0.11.5"])
    else
      s.add_dependency(%q<thor>, [">= 0.11.5"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0.11.5"])
  end
end

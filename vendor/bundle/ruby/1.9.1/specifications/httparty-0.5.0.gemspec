# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "httparty"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker", "Sandro Turriate"]
  s.date = "2009-12-07"
  s.description = "Makes http fun! Also, makes consuming restful web services dead easy."
  s.email = "nunemaker@gmail.com"
  s.executables = ["httparty"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["bin/httparty", "README.rdoc"]
  s.homepage = "http://httparty.rubyforge.org"
  s.post_install_message = "When you HTTParty, you must party hard!"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "httparty"
  s.rubygems_version = "1.8.11"
  s.summary = "Makes http fun! Also, makes consuming restful web services dead easy."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<crack>, [">= 0.1.1"])
      s.add_development_dependency(%q<activesupport>, ["~> 2.3"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.4"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.2"])
      s.add_development_dependency(%q<mongrel>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec>, ["= 1.2.9"])
    else
      s.add_dependency(%q<crack>, [">= 0.1.1"])
      s.add_dependency(%q<activesupport>, ["~> 2.3"])
      s.add_dependency(%q<cucumber>, ["~> 0.4"])
      s.add_dependency(%q<fakeweb>, ["~> 1.2"])
      s.add_dependency(%q<mongrel>, ["~> 1.1"])
      s.add_dependency(%q<rspec>, ["= 1.2.9"])
    end
  else
    s.add_dependency(%q<crack>, [">= 0.1.1"])
    s.add_dependency(%q<activesupport>, ["~> 2.3"])
    s.add_dependency(%q<cucumber>, ["~> 0.4"])
    s.add_dependency(%q<fakeweb>, ["~> 1.2"])
    s.add_dependency(%q<mongrel>, ["~> 1.1"])
    s.add_dependency(%q<rspec>, ["= 1.2.9"])
  end
end

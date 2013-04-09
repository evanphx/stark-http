# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "stark-http"
  s.version = "1.0.0.20130409155509"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evan Phoenix"]
  s.date = "2013-04-09"
  s.description = "HTTP Transport for Thrift services.\n\n![stark](http://ecx.images-amazon.com/images/I/41FuQ1aAkVL._SL500_AA300_.jpg)"
  s.email = ["evan@phx.io"]
  s.executables = ["stark_http"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.md", "Rakefile", "bin/stark_http", "lib/stark/http.rb", "test/test_stark_http.rb", ".gemtest"]
  s.homepage = "https://github.com/evanphx/stark-rack"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "stark-http"
  s.rubygems_version = "1.8.25"
  s.summary = "HTTP Transport for Thrift services"
  s.test_files = ["test/test_stark_http.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<stark>, ["< 2.0.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.5"])
    else
      s.add_dependency(%q<stark>, ["< 2.0.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<stark>, ["< 2.0.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.5"])
  end
end

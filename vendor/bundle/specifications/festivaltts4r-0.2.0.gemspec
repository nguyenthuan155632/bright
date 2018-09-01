# -*- encoding: utf-8 -*-
# stub: festivaltts4r 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "festivaltts4r".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergio Espeja".freeze]
  s.date = "2007-12-18"
  s.description = "Text-to-speech for Ruby using festivaltts. Provides two new methods for String: to_speech and to_mp3. Requires festivaltts and lame.".freeze
  s.email = "sergio.espeja@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGELOG.txt".freeze, "History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = ["CHANGELOG.txt".freeze, "History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.homepage = "http://festivaltts4r.rubyforge.org".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubyforge_project = "festivaltts4r".freeze
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Text-to-speech for Ruby using festivaltts. Provides two new methods for String: to_speech and to_mp3. Requires festivaltts and lame.".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hoe>.freeze, [">= 1.3.0"])
    else
      s.add_dependency(%q<hoe>.freeze, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<hoe>.freeze, [">= 1.3.0"])
  end
end

# -*- encoding: utf-8 -*-
# stub: hoe 3.17.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hoe".freeze
  s.version = "3.17.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.4".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBAjANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE3MTEyMTIxMTExMFoXDTE4MTEyMTIxMTExMFowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB\nAQAfAXSQpsW7YSxd1csRtA/M4Zt0AMXFMd76GJ8Lgtg8G0+VFbdChRyDuDb0kPlW\nh9QQX/YABfCW8vxmssbMGrP+VGBAn7BbdTcfTlgCWrvMX1uL5aRL74nA4urKXqdW\na0nP70K4958P3GffBdtE3KGkU5xstFnXGajxuBRnL66E15KU0BNehVxdG258bdPu\nEKN6MqBPftFiev3tuwqDV11r2GquDpniYcT+Mi8/PgeAgVT/afBeVgbB3KaZeTRR\nAhXhF6Wi2GTMezlj5jlI5XV7WsJUSwTp/YiVvcmT74ZaCRvexm6EnNhkrvJJ1Xeu\nV+HB+LYYhXWitInO/eXxDrFB\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2018-03-17"
  s.description = "Hoe is a rake/rubygems helper for project Rakefiles. It helps you\nmanage, maintain, and release your project and includes a dynamic\nplug-in system allowing for easy extensibility. Hoe ships with\nplug-ins for all your usual project tasks including rdoc generation,\ntesting, packaging, deployment, and announcement..\n\nSee class rdoc for help. Hint: `ri Hoe` or any of the plugins listed\nbelow.\n\nFor extra goodness, see: http://docs.seattlerb.org/hoe/Hoe.pdf".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze]
  s.executables = ["sow".freeze]
  s.extra_rdoc_files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "bin/sow".freeze]
  s.homepage = "http://www.zenspider.com/projects/hoe.html".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Hoe is a rake/rubygems helper for project Rakefiles".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, ["< 13.0", ">= 0.8"])
      s.add_development_dependency(%q<rdoc>.freeze, ["< 6", ">= 4.0"])
    else
      s.add_dependency(%q<rake>.freeze, ["< 13.0", ">= 0.8"])
      s.add_dependency(%q<rdoc>.freeze, ["< 6", ">= 4.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["< 13.0", ">= 0.8"])
    s.add_dependency(%q<rdoc>.freeze, ["< 6", ">= 4.0"])
  end
end

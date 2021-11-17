files=%w[README.md
stoopidoo/interface.rb
stoopidoo/math_helper.rb
stoopidoo/rules_data.rb
stoopidoo/time_ext.rb
bin/stoopidoo
stoopidoo.gemspec
]
Gem::Specification.new do |s|
  s.name = 'stoopidoo'
  s.version = '0.0.1'
  s.date = '2021-08-01'
  s.summary = "Local trash-talking bot written in Ruby."
  s.authors = ["xxanon"]
  s.email = "ironald@gmail.com"
  s.files = files
  s.executables << 'stoopidoo'
  s.homepage = "https://github.com/nonnax/stoopidoo.git"
  s.license = "GPL-3.0"
end

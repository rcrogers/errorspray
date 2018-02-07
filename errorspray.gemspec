Gem::Specification.new do |s|

  s.name        = 'errorspray'
  s.version     = '1.0.1'
  s.date        = '2018-02-07'
  s.summary     = 'Makes it easy to append contextual information to error messages'
  s.description = ''
  s.authors     = ['Chris Rogers']
  s.email       = ''
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.homepage    = 'https://github.com/rcrogers/errorspray'

  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-expectations'

end

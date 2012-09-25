Gem::Specification.new do |s|
  s.name = 'mock_sftp'
  s.version = '0.0.1'
  s.summary = 'Mock up an net/sftp session'
  s.description = "Can be used to mimic the behaviour of an sftp session, based on a local filesystem location"

  s.authors = ['MSP Dev Team',     'Nick Griffiths']
  s.email   = ['devs@mediasp.com', 'nicobrevin@gmail.com']
  s.homepage = 'https://github.com/playlouder'

  s.files = Dir['lib/**/*.rb']
end

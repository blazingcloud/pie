
spec = Gem::Specification.new do |s| 
	s.name = 'pie'
  s.authors = 'Sarah Allen, Sarah Mei'
  s.homepage = 'http://github.com/blazingcloud/pie'
	s.version = '0.2' 
	s.summary = 'Pie, a language for developing games and books' 
	s.files = Dir['lib/*']+Dir['bin/*']+Dir['views/*']+['README.md', 'MIT-LICENSE.txt']
  s.bindir = 'bin'
  s.executables << 'pie'
end

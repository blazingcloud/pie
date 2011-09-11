
spec = Gem::Specification.new do |s| 
	s.name = 'pie'
  s.authors = 'Sarah Allen, Sarah Mei, Rich Kilmer'
  s.homepage = 'http://github.com/blazingcloud/pie'
	s.version = '0.2.13' 
	s.summary = 'Pie, a language for developing games and books' 
	s.files = Dir['lib/*.rb']+Dir['views/*.erb']+['README.md', 'MIT-LICENSE.txt', 'bin/pie']
  s.bindir = 'bin'
  s.executables << 'pie'
end

Gem::Specification.new do |s|
  s.name     = "verbal"
  s.version  = "0.1"
  s.date     = "2008-07-25"
  s.summary  = "Converts numbers, currency and other units to Polish (more to come)"
  s.email    = "tomek@trix.pl"
  s.homepage = "http://github.com/tomaszmazur/verbal"
  s.description = "Verbal - library for converting units (time, currency, weight, height) to Polish words. More languages to come"
  s.has_rdoc = false
  s.authors  = ["Tomasz Mazur"]
  s.files    = ["History.txt",
                "Manifest.txt",
		"README.txt",
		"verbal.gemspec",
		"lib/currency/currency.rb",
		"lib/verbal/core.rb",
		"lib/verbal.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("mime-types", ["> 0.0.0"])
end
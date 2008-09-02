Gem::Specification.new do |s|
  s.name = %q{verbal}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tomasz Mazur"]
  s.date = %q{2008-08-01}
  s.description = %q{Converts numbers to words (its text presentation) Currently supported languages are:  -English * - Polish  NOTE: It's American English numbering system http://www.mazes.com/AmericanNumberingSystem.html}
  s.email = ["tomek@trix.pl"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/verbal.rb", "lib/verbal/core.rb","lib/verbal/english/numbers.rb", "lib/verbal/polish/numbers.rb", "lib/verbal/polish/currency.rb", "lib/verbal/german/numbers.rb", "spec/spec_helper.rb", "spec/unit/polish/currency_spec.rb", "spec/unit/polish/numbers_spec.rb", "spec/unit/english/numbers_spec.rb", "spec/unit/german/numbers_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{  http://trix.lighthouseapp.com/projects/14763-verbal}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{verbal}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Converts numbers to words (its text presentation) Currently supported languages are:  - English * - Polish  NOTE: It's American English numbering system http://www.mazes.com/AmericanNumberingSystem.html}

end
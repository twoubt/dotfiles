files = Dir.glob("*")
ignored = ['README.md', 'com.googlecode.iterm2.plist', 'term_colours', 'symlink.rb', 'Brewfile.sh', 'cleanup.sh']
dotfiles = []

files.each do |file|
	ignored.include?(file) ? '' : dotfiles << file
end

dotfiles.each do |file|
  home_path = File.join('/Users', 'Zhou', '.' + file)
  file_path = File.expand_path(file, File.dirname(__FILE__))
  File.delete(home_path) if File.exist?(home_path)
  File.symlink(file_path, home_path)
end

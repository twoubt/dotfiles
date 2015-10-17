files = Dir.glob("*")
ignored = ['README.md', 'com.googlecode.iterm2.plist', 'term_colours', 'symlink.rb', 'Brewfile.sh', 'cleanup.sh']
dotfiles = []

files.each do |file|
	ignored.include?(file) ? '' : dotfiles << file
end

dotfiles.each do |file|
	File.delete(File.join('/Users', 'Zhou', '.' + file))
	File.symlink(File.expand_path(file, File.dirname(__FILE__)), File.join('/Users', 'Zhou', '.' + file))
end

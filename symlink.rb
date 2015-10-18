files = Dir.glob("*")
ignored = ['powerline', 'README.md', 'com.googlecode.iterm2.plist', 'term_colours', 'symlink.rb', 'Brewfile.sh', 'cleanup.sh']
dotfiles = []

def file_path(file)
  File.expand_path(file, File.dirname(__FILE__))
end

def home_path(file, path = '.')
  "/Users/Zhou/" + path + file
end

files.each do |file|
	ignored.include?(file) ? '' : dotfiles << file
end

dotfiles.each do |file|
  File.delete(home_path(file)) if File.exist?(home_path(file))
  File.symlink(file_path(file), home_path(file))
end

File.symlink(file_path(ignored[0]), home_path(ignored[0], '.config/'))

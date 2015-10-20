require 'fileutils'

files = Dir.glob("*")
@ignore_files = ['README.md', 'com.googlecode.iterm2.plist', 'term_colours', 'symlink.rb', 'Brewfile.sh', 'cleanup.sh']
@bin = ['tat']
@powerline = ['powerline']
@dotfiles = []

def source_from(file)
  p File.expand_path(file, File.dirname(__FILE__))
end

def source_to(file, path= '')
  p path + file
end

def move_existing(file, path)
  FileUtils.mkdir('~/old_dotfiles') unless File.exists?(File.expand_path('~/old_dotfiles'))
  if File.exists?(File.expand_path(source_to(file, path)))
    FileUtils.mv(source_to(file, path), '~/old_dotfiles/'+file)
  end
end

def skip_file?(file)
  @ignore_files.include?(file) || @bin.include?(file) || @powerline.include?(file)
end

files.each do |file|
	@dotfiles << file unless skip_file?(file)
end

@dotfiles.each do |file|
  move_existing(file, '~/.')
  File.symlink(source_from(file), source_to(file, '~/.'))
end

@bin.each do |file|
  move_existing(file, '/usr/local/bin/')
  File.symlink(source_from(file), source_to(file, '/usr/local/bin/'))
  FileUtils.chmod("u+x", source_to(file, '/usr/local/bin/'))
end

@powerline.each do |file|
  move_existing(file, '~/.config/')
  File.symlink(source_from(file), source_to(file, '~/.config/'))
end

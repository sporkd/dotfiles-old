require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  distro = `uname`.strip.downcase
  excludes = %w[Rakefile README.rdoc LICENSE distro bin]

  distro_files = Dir["distro/#{distro}/*"].collect { |f| f.sub("distro/#{distro}/", '') }
  default_files = Dir["*"] - excludes - distro_files

  default_files.each { |file| process_file(file) }
  distro_files.each { |file| process_file(file, distro) }

  FileUtils.mkdir_p(File.join(ENV['HOME'], 'code'))
  FileUtils.mkdir_p(File.join(ENV['HOME'], 'projects'))
end

def process_file(file, distro=nil)
  replace_all = false
  path = distro ? "distro/#{distro}/" : ""

  dotfile = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")

  File.unlink(dotfile) if File.symlink?(dotfile)

  if File.exist?(dotfile)
    if File.identical?(path+file, dotfile)
      puts "identical ~/.#{file.sub('.erb', '')} == #{path+file}"
    elsif replace_all
      replace_file(file, path)
    else
      print "overwrite ~/.#{file.sub('.erb', '')} with #{path+file}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file, path)
      when 'y'
        replace_file(file, path)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file.sub('.erb', '')}"
      end
    end
  else
    link_file(file, path)
  end
end

def replace_file(file, path)
  system %Q{rm "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file, path)
end

def link_file(file, path)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')} from #{path+file}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(path+file)).result(binding)
    end
  else
    puts "linking ~/.#{file} -> #{path+file}"
    system %Q{ln -s "$PWD/#{path+file}" "$HOME/.#{file}"}
  end
end

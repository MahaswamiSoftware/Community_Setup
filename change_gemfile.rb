gemfile_path = ARGV[0]+"/Gemfile"
if File.exist? gemfile_path
	text = File.read(gemfile_path)
	replace = text.gsub(/https/, "http")
	File.open(gemfile_path, "w") {|file| file.puts replace}
end

gemlock_path = ARGV[0]+"/Gemfile.lock"
if File.exist? gemlock_path
	data = File.read(gemlock_path)
	change_text = data.gsub(/https/, "http")
	File.open(gemlock_path, "w") {|file| file.puts change_text}
end

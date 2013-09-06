if ARGV[0] == "stage1"
 external_migrations = ["core", "gui", "user", "ck_multimedia", "publisher_common"] 
else
 external_migrations = ["document", "review"]
end
Dir.chdir('cg_community/db/migrate') do
	external_migrations.compact.each {|m|
		files = Dir["../../../cg_#{m}/db/migrate/*.rb"]
		files.each {|f|
			full_path = File.expand_path f
			cmd = "ln -s #{full_path}"
			`#{cmd}`
		}
	}	
end

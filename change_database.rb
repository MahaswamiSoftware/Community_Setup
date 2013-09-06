require 'yaml'
data = { "development"=>{"adapter"=>"postgresql", "encoding"=>"unicode", "database"=>ARGV[3],
					"username"=>ARGV[1], "password"=>ARGV[2], "host"=>"localhost"}}
if File.basename(ARGV[0]) == "scholar"
 database_yaml_path = ARGV[0]+"/database.yml"
else
 database_yaml_path = ARGV[0]+"/config/database.yml" 
end
File.open(database_yaml_path, 'w+') { |f| YAML.dump(data, f) }


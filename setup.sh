# IMPORTANT: Source RVM as a function into local environment.
#            Otherwise switching gemsets won't work.
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

#Auto setup
community_setup_path=$PWD

#setup the ruby compatible versions and gemsets
scholar_location=/home/msuser1/workspace/git_scholar/ms_scholar/scholar
identity_ruby_version=ruby-1.9.3-p286
identity_gemset=KK_mupp_cg_identity
community_ruby_version=jruby-1.7.0
community_gemset=KK_mupp_cg_community

# Setup database authentications
database_username=cg_community
database_password=cg_community

# Setup database names accordingls branch
community_database=KK_mupp_cg_community_dev
comment_service_database=KK_mupp_cg_comment_service_dev
lookup_service_database=KK_mupp_cg_lookup_service_dev
message_service_database=KK_mupp_cg_message_service_dev
role_service_database=KK_mupp_cg_role_service_dev
notification_service_database=KK_mupp_cg_notification_service_dev
star_service_database=KK_mupp_cg_star_service_dev

cd $scholar_location
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $community_database
# Enable shell debugging.
#set -x
echo "*****************************************"
############### cg_identity
rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset
echo "In " $PWD
echo -e "\n"
rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

cd cg_identity
echo "In " $PWD
echo -e "\n"
echo `rvm current`
ruby $community_setup_path/change_gemfile.rb $PWD
gem install 'gem-dependency_management'
bundle install
git checkout Gemfile
git checkout Gemfile.lock
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### Trunk
cd ..
echo "In " $PWD
echo -e "\n"
gem install foreman

echo `rvm current`
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### cg_community

cd cg_community 

rvm use $community_ruby_version
rvm gemset create $community_gemset
rvm gemset use $community_gemset
echo "In " $PWD
echo -e "\n"

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $community_ruby_version
rvm gemset use $community_gemset 
EOF
rvm rvmrc trust $PWD
echo -e "\n"
echo "In " $PWD

echo `rvm current`
ruby $community_setup_path/change_gemfile.rb $PWD
gem install 'gem-dependency_management'
bundle install
git checkout Gemfile
git checkout Gemfile.lock

echo "....................................................."
echo -e "\n"
echo -e "\n"


############### services/cg_comment_service

cd ../services/cg_comment_service 
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $comment_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` comment_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/cg_lookup_service
cd ../cg_lookup_service
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $lookup_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` lookup_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/cg_message_service
cd ../cg_message_service
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $message_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` message_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/cg_notification_service
cd ../cg_notification_service
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $notification_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` notification_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/cg_role_service
cd ../cg_role_service
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $role_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` role_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/faye
cd ../faye
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
rvm wrapper `rvm current` faye ruby

echo "....................................................."
echo -e "\n"
echo -e "\n"

############### services/cg_star_service
cd ../cg_star_service
echo -e "\n"
echo "In " $PWD

rvm use $identity_ruby_version
rvm gemset create $identity_gemset
rvm gemset use $identity_gemset

rm -rf .rvmrc
cat <<EOF >.rvmrc
rvm use $identity_ruby_version
rvm gemset use $identity_gemset 
EOF
rvm rvmrc trust $PWD

echo -e "\n"
echo `rvm current`

ruby $community_setup_path/change_gemfile.rb $PWD
bundle install
git checkout Gemfile
git checkout Gemfile.lock
#Database yaml creation
ruby $community_setup_path/change_database.rb $PWD $database_username $database_password $star_service_database
bundle exec rake db:create
bundle exec rake db:migrate
rvm wrapper `rvm current` star_service ruby
echo "....................................................."
echo -e "\n"
echo -e "\n"

#Cg_community build order migrations
echo "community build orders..................................."
cd ../../cg_community
echo 'In' $PWD
enviro='development'

if [ $# -eq 1 ]
then
  enviro=$1
  echo 'RAILS_ENV='$enviro
fi

ENGINES=$(cat config/build_order)
#Database yaml creation
#link my config/database.yml file to the root/database.yml
if [ -L config/database.yml ]
then
  rm config/database.yml
fi
echo 'Sym-linking ../database.yml ./config/database.yml'
ln -s ../../database.yml config/database.yml

bundle exec rake db:create

#For each engine in our build_order
cd ..
echo 'In ' $PWD
ruby ~/workspace/cg_community_setup/link_migrations.rb stage1
cd cg_community

#Back in the application, migrate and seed
RAILS_ENV=$enviro bundle exec rake db:migrate
cd ..
ruby ~/workspace/cg_community_setup/link_migrations.rb stage2
cd cg_community

RAILS_ENV=$enviro bundle exec rake db:migrate
mv db/seeds db/seeds_test
mv db/seeds.rb db/seeds_test.rb
for e in ${ENGINES}; do
    #change to engine directory
    pushd ../cg_${e} > /dev/null
    PWD=$(pwd)
    echo 'cd' $PWD 
    if [ -d db/seeds ]
    then
      cp -r db/seeds ../cg_community/db
    fi
    if [ -f db/seeds.rb ]   
    then
		cp db/seeds.rb ../cg_community/db    
		if [ $enviro != 'test' ]; then
		  cd ../cg_community
		  RAILS_ENV=$enviro bundle exec rake db:seed
		  rm db/seeds.rb
		  if [ -d db/seeds ]
		  then
			rm -r db/seeds
		  fi
		  cd ../cg_${e}
		fi		
	fi
popd > /dev/null
done

mv db/seeds_test.rb db/seeds.rb
mv db/seeds_test db/seeds
if [ $enviro != 'test' ]; then
  RAILS_ENV=$enviro bundle exec rake db:seed
fi

#Removing the link files from community migrate directory
find db/migrate/ -lname '*' -exec rm {} \;

#Cg_identity build order migrations
cd ../cg_identity

#link my config/database.yml file to the root/database.yml
if [ -L config/database.yml ]
then
  rm config/database.yml
fi
echo 'Sym-linking ../database.yml ./config/database.yml'
ln -s ../../database.yml config/database.yml

bundle exec rake db:create
#Back in the application, migrate and seed
RAILS_ENV=$enviro bundle exec rake db:migrate
if [ $enviro != 'test' ]; then
  RAILS_ENV=$enviro bundle exec rake db:seed
fi




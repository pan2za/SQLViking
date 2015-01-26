#!/bin/bash

sudo apt-get install git -y
sudo apt-get install unzip -y

mkdir /opt/weakapp
cp -R /vagrant/sinatra-app/* /opt/weakapp

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0
source /home/vagrant/.rvm/scripts/rvm
source /usr/local/rvm/scripts/rvm

#Grab Dependencies
sudo apt-get install freetds-dev freetds-bin tdsodbc libmysqlclient-dev redis-server -y

#Start Redis Server
redis-server &

cd /opt/weakapp
rvm use 2.0.0
bundle install
bundle exec sidekiq -r ./app.rb &
rake db:create
rake db:migrate
rake db:seed
cmd="ruby app.rb &"
$cmd




#
# Cookbook Name:: selenium-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java"

bash "download_selenium" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
wget https://selenium.googlecode.com/files/selenium-server-standalone-2.34.0.jar
EOH
not_if { File.exists?("/home/vagrant/chef-solo/selenium-server-standalone-2.34.0.jar") }
end

bash "start_hub" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
java -jar selenium-server-standalone-2.34.0.jar -role hub -port 4444 &
EOH
end

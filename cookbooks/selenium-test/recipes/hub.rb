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
wget "#{node.selenium.url}#{node.selenium.name}#{node.selenium.version}.jar"
EOH
not_if { File.exists?(File.join(Dir.pwd, 'cache')+"/#{node.selenium.name}#{node.selenium.version}.jar")}
end

bash "start_hub" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
java -jar "#{node.selenium.name}#{node.selenium.version}.jar" -role hub -port 4444 &
EOH
end

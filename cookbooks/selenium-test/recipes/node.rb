#
# Cookbook Name:: selenium-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "powershell"

powershell "download selenium" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  $webclient = New-Object System.Net.WebClient;
$url = "#{node.selenium.url}#{node.selenium.name}#{node.selenium.version}.jar";
$file = "#{node.selenium.name}#{node.selenium.version}.jar";
$webclient.DownloadFile($url,$file);
EOH
  not_if { File.exists?(File.join(Dir.pwd, 'cache')+"/#{node.selenium.name}#{node.selenium.version}.jar")}
end

# powershell "install browser" do 
# 	code <<-EOH
# 	cinst #{node.browser.package} #{node.browser.version}
# 	EOH
# end

powershell "start_node" do
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
 Start-Process java.exe -ArgumentList "-jar #{node.selenium.name}#{node.selenium.version}.jar -role node -hub #{node.server.ip} -nodeConfig #{node.settings.config}"
EOH
end

# windows_batch "ffox" do
  # code <<-EOH
  # cinst Firefox
  # EOH
# end

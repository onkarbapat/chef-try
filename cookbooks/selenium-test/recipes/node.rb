#
# Cookbook Name:: selenium-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chocolatey"

windows_batch "ffox" do
  code <<-EOH
  cinst Firefox
  EOH
end
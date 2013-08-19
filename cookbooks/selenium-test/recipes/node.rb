#
# Cookbook Name:: selenium-test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java"
include_recipe "chocolatey"

chocolatey ENV["cpack"]
#
# Cookbook Name:: jruby
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"

version = node[:jruby][:version]

remote_file "/usr/src/jruby-bin-#{version}.tar.gz" do
  source "http://jruby.org.s3.amazonaws.com/downloads/#{version}/jruby-bin-#{version}.tar.gz"
  checksum node[:jruby][:checksum]
end

execute "untar jruby" do
  command "tar xzf /usr/src/jruby-bin-#{version}.tar.gz "
  cwd "/usr/local/lib"
  creates "/usr/local/lib/jruby-#{version}"
end

link "/usr/local/jruby" do
  to "/usr/local/lib/jruby-#{version}"
end

%w( jruby jirb jgem ).each do |b|
  link "/usr/local/bin/#{b}" do
    to "/usr/local/jruby/bin/#{b}"
  end
end

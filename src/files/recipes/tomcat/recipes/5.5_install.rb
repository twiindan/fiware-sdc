#
# Cookbook Name:: tomcat
# Recipe:: 5.5_install
#
# Copyright 2011, Telefonica I+D
#
# Author: Jesus M. Movilla
#
# All rights reserved - Do Not Redistribute

script "install_tomcat5.5.33" do
  interpreter "bash"
  user "root"
  cwd node["tomcat5.5"]["base_install"] 
  code <<-EOH
  if [ -d /opt/apache-tomcat ]
  then
  echo "Already installed"
  else 
  wget http://apache.rediris.es/tomcat/tomcat-5/v5.5.33/bin/apache-tomcat-5.5.33.tar.gz
  gunzip apache-tomcat-5.5.33.tar.gz
  tar xvf apache-tomcat-5.5.33.tar
  mv apache-tomcat-5.5.33 apache-tomcat
  fi
  EOH
end

#script "Tomcat stop" do
#  interpreter "bash"
#  user "root"
#  cwd "/tmp"
#  code <<-EOH
#  export JRE_HOME=/usr/lib/jvm/java-6-openjdk/jre
#  if [ -d /opt/apache-tomcat ]
#  then
#  /opt/apache-tomcat/bin/shutdown.sh
#  fi
#  EOH
#end

#template "/opt/apache-tomcat/conf/server.xml" do
#  source "server.xml.erb"
#  owner "root"
#  group "root"
#  mode "0644"
#  variables(
#    :tomcat_node => node["tomcat"]["port"]
#  )
#end


script "Tomcat start" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  sleep 10
  export JRE_HOME=/usr/lib/jvm/java-6-openjdk/jre
  if [ -d /opt/apache-tomcat ]
  then
  /opt/apache-tomcat/bin/startup.sh
  fi
  EOH
end
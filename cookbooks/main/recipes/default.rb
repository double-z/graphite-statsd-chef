require_recipe 'apt'
apt_repository "nodejs" do
  uri "http://ppa.launchpad.net/chris-lea/node.js"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "44A334DA"
end

%w(nodejs npm memcached git-core sqlite3 libcairo2 libcairo2-dev python-cairo pkg-config).each do |name|
  package name
end

require_recipe 'python::package'
require_recipe 'python::pip'

python_pip "django" do
  version '1.3'
  action :install
end

python_pip "python-memcached"
python_pip "django-tagging" do
  version '0.3.1'
  action :install
end
python_pip "twisted"
python_pip "whisper" do
  version '0.9.9'
  action :install
end
python_pip "carbon" do
  version '0.9.9'
  action :install
end
python_pip "graphite-web" do
  version "0.9.9"
  action :install
end


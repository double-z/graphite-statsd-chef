require_recipe 'apt'

%w(python-software-properties nodejs npm git memcached python-dev python-pip sqlite3 libcairo2 libcairo2-dev python-cairo pkg-config).each do |name|
  package name
end

apt_repository "nodejs" do
  uri "http://ppa.launchpad.net/chris-lea/node.js"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "44A334DA"
end


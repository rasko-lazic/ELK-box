# install Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer

# install ElasticSearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update
sudo apt-get -y install elasticsearch

sudo echo "network.host: localhost" >> /etc/elasticsearch/elasticsearch.yml

sudo service elasticsearch restart
sudo update-rc.d elasticsearch defaults 95 10

# install Kibana
echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list
sudo apt-get update
sudo apt-get -y install kibana

# add Kibana config here

sudo update-rc.d kibana defaults 96 9
sudo service kibana start

# install Nginx
sudo apt-get -y install nginx apache2-utils
sudo htpasswd -c /etc/nginx/htpasswd.users admin

# add Nginx config here

sudo service nginx restart

# install Logstash
echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash-2.2.x.list
sudo apt-get update
sudo apt-get -y install logstash



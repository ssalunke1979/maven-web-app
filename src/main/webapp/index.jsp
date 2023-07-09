<html>
<body>
<h1><font color='blue'> Welcome to My First Website <font></h1>
<h2>Learn Here.. Lead Anywhere..!! </h2>

1. jenkins - 192.168.1.10
2. sonarqube - 192.168.1.11
3. tomcat - 192.168.1.12
4. nexus - 192.168.1.13


#host entries
192.168.1.10 www.jenkins.com jenkins.com 
192.168.1.11 www.sonar.com sonar.com
192.168.1.12 www.tomcat.com tomcat.com
192.168.1.13 www.nexus.com nexus.com


#Sonar-qube 
https://www.howtoforge.com/-how-to-install-sonarqube-on-ubuntu-20-04/#install-and-configure-sonarqube
uname: admin
passwd: redhat

#add vm.max_map_count in sysctl.conf permanently
vi /etc/sysctl.conf
sysctl -w vm.max_map_count=262144
sysctl -p

#tomcat
https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-10-on-ubuntu-20-04
https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.10/bin/

uname: admin
passed: redhat


#Nexus
https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/
https://help.sonatype.com/repomanager3/product-information/download


#get admin passwd - "cat /opt/nexus/sonatype-work/nexus3/admin.password"

uname: admin
passwd: redhat

##nginx proxy
###################
apt-get install nginx -y


#nginx reverse proxyconfigured
###
rm -f /etc/nginx/sites-available/default
rm -f /etc/nginx/sites-enabled/default

/etc/nginx/sites-available/jenkins.conf



upstream jenkins_backend {
  server 127.0.0.1:8080;
}

server {
    listen 80;
    server_name jenkins.example.com;

    location / {
        proxy_pass http://jenkins_backend/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forward-Proto http;
        proxy_set_header X-Nginx-Proxy true;

        proxy_redirect off;
    }
}

#symlinks
ln -s  /etc/nginx/sites-available/jenkins.conf /etc/nginx/sites-enabled/jenkins
##########

#use of ls command inside any vagrant nodes
vagrant ssh -c "ls -l /etc/nginx/sites-available/" node1



   <h2> Good Day, Happy Weed End!!! </h2>

</body>
</html>

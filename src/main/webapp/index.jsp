<html>
<body>
<h1><font color='blue'> Welcome to My First Website <font></h1>
<h2>Learn Here.. Lead Anywhere..!! </h2>

<details>
<summary>Jenkins CI-CD Notes</summary>

<p> 1. jenkins - 192.168.1.10 </p>
<p> 2. sonarqube - 192.168.1.11 </p>
<p> 3. tomcat - 192.168.1.12 </p>
<p> 4. nexus - 192.168.1.13 </p>

<p> #host entries </p>
<p> 192.168.1.10 www.jenkins.com jenkins.com  </p>
<p> 192.168.1.11 www.sonar.com sonar.com </p>
<p> 192.168.1.12 www.tomcat.com tomcat.com </p>
<p> 192.168.1.13 www.nexus.com nexus.com </p>

<p> #Sonar-qube  </p>
<p> https://www.howtoforge.com/-how-to-install-sonarqube-on-ubuntu-20-04/#install-and-configure-sonarqube </p>
<p> uname: admin </p>
<p> passwd: redhat </p>

<p> #add vm.max_map_count in sysctl.conf permanently </p>
<p> vi /etc/sysctl.conf </p>
<p> sysctl -w vm.max_map_count=262144 </p>
<p> sysctl -p </p>

<p> #tomcat </p>
<p> https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-10-on-ubuntu-20-04 </p>
<p> https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.10/bin/ </p>

<p> uname: admin </p>
<p> passed: redhat </p>

<p> #Nexus </p>
<p> https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/ </p>
<p> https://help.sonatype.com/repomanager3/product-information/download </p>

<p> #get admin passwd - "cat /opt/nexus/sonatype-work/nexus3/admin.password" </p>

<p> uname: admin </p>
<p> passwd: redhat </p>

<p> ##nginx proxy </p>
<p> ################### </p>
<p> apt-get install nginx -y </p>

<p> #nginx reverse proxyconfigured </p>
<p> ### </p>
<p> rm -f /etc/nginx/sites-available/default </p>
<p> rm -f /etc/nginx/sites-enabled/default </p>

<p> /etc/nginx/sites-available/jenkins.conf </p>



<p> upstream jenkins_backend { </p>
<p>   server 127.0.0.1:8080; </p>
<p> } </p>

<p> server { </p>
<p>     listen 80; </p>
<p>     server_name jenkins.example.com; </p>

<p>     location / { </p>
<p>         proxy_pass http://jenkins_backend/; </p>
<p>         proxy_http_version 1.1; </p>
<p>         proxy_set_header Upgrade $http_upgrade; </p>
<p>         proxy_set_header Connection "upgrade"; </p>
<p>         proxy_set_header Host $http_host; </p>

<p>         proxy_set_header X-Real-IP $remote_addr; </p>
<p>         proxy_set_header X-Forward-For $proxy_add_x_forwarded_for; </p>
<p>         proxy_set_header X-Forward-Proto http; </p>
<p>         proxy_set_header X-Nginx-Proxy true; </p>
<p> 
<p>         proxy_redirect off; </p>
<p>     } </p>
<p> } </p>

<p> #symlinks </p>
<p> ln -s  /etc/nginx/sites-available/jenkins.conf /etc/nginx/sites-enabled/jenkins </p>
<p> ########## </p>

<p> #use of ls command inside any vagrant nodes </p>
<p> vagrant ssh -c "ls -l /etc/nginx/sites-available/" node1 </p>
</p>
</details>
   <h2> Good Day, Happy Weed End!!! </h2>

</body>
</html>

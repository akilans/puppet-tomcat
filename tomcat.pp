node default {

 file { '/etc/systemd/system/tomcat.service':

     source => '/home/akilan/puppet/tomcat.service'

 }

 exec { 'Extract tar file':
  
  command => 'tar -xvf /home/akilan/puppet/tomcat.tar.gz -C /opt/tomcat --strip-components=2',
  path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
 
 }

 service { "tomcat": 
    provider => systemd,
    ensure => running,
    enable => true,
 }

 file { '/opt/tomcat/webapps/sample.war':

    source => '/home/akilan/puppet/sample.war'

 }

 exec { 'Restart Tomcat Service':

  command => 'systemctl restart tomcat',
  path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]

 }
 

}

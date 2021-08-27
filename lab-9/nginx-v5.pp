$app = "nginx"
$version = "v5"
#$content = "<h2>Welcome to ${app}-${version}.pp By DIALLOb on puppet server</h2>"

package { "install $app":
  name   => $app,
  ensure => 'installed',
}

service { "start $app":
  name      => $app,
  ensure    => 'running',
  enable    => 'true',
  #nginx redemarre que si exécution de package ou de file
  subscribe => [
    Package["install $app"],
    File['/usr/share/nginx/html/index.html'],
  ],
}

#eventuelement file notifie le service nginx,
if $osfamily == 'RedHat' {
  file { '/usr/share/nginx/html/index.html':
  content => epp('/root/puppet-training/lab-9/content.epp'),
  notify  => Service["start $app"],
  }
}

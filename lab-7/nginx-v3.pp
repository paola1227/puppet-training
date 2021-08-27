$app = "nginx"
$version = "v3"
$content = "Welcome to ${app}-${version}.pp By Paola on puppet server"

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
file { '/usr/share/nginx/html/index.html':
  content => $content,
  notify  => Service["start $app"],
}


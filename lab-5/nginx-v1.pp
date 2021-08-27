package { 'nginx':
  ensure => 'present',
}

service { 'nginx':
  ensure => 'running',
  enable => 'true',
}

file { '/usr/share/nginx/html/index.html':
  content => "Welcome to nginx-v1.pp By Paola ARIZA on puppet server",
}


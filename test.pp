user { 'alex':
  ensure             => 'present',
  comment            => 'root',
  gid                => 0,
  home               => '/root',
  sell              => '/bin/bash',
  uid                => 0,
}


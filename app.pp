notify { 'webmaster_note':
	message => "creating webmaster's account and files",
}

package { 'httpd':
	ensure => 'present',
 }
user { 'webmaster':
	ensure => 'present',
	home => '/var/www',
	shell => '/bin/bash',
	require => Package['httpd'],
 }

file { '/var/www':
	ensure => 'directory',
 	owner => 'webmaster',
 	mode  => '0755',
 	require => User['webmaster'],
}



service { 'httpd':
	ensure => 'running',
 	enable => 'true',
 	require => Package['httpd'],
}

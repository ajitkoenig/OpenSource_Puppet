notify { 'webmaster_note':
	message => "creating webmaster's account and files",
}

user { 'webmaster':
	ensure => 'present',
	home => '/var/www',
	shell => '/bin/bash'
	require => Package['httpd-server'],
 }

file { '/var/www':
	ensure => 'directory',
 	owner => 'webmaster',
 	mode -> '0755',
 	require => User['webmaster'],
}

package { 'httpd':
	ensure => 'present',
 	path => '/usr/local',
 }

service { 'httpd':
	ensure => 'installed',
 	enable => yes,
 	require => Package['httpd'],
}

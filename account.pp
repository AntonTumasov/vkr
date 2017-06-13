class base::account($ensure = $base::params::ensure) inherits base{
case $::osfamily {
/(RedHat|Debian)/: {
    file {'/home/student': ensure => directory;}
    user {'Student':
    ensure => $ensure,
    password => '$6$uwvxD7g4XjaO/EER$2S66UpteIC0FFh0VHH8NnuZdpX9t8aTeV9TignRxrBcsCptHj42y62HRvpbEGedOj1XQV7Nu.GQazCwwC7EAE0',
    require => Group['Student'],
    home => '/home/student',
    groups => ['Student'];
    }
    group {'Student': ensure=> present;}
  }
'Windows': {
 user{ 'Student':
  ensure => $ensure,
  password => 'Pa$$w0rD',
  home => 'C:\Users\Student',
  groups => ['Users','Remote Desktop Users'],
  managehome => true;
  }
 }

  }
}

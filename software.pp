class base::software(){
  base::package {'packages':
    openofficesource => 'C:/temp/Apache_OpenOffice_4.1.3_Win_x86_install_ru.exe',
    maximapath => 'C:/temp/maxima-clisp-sbcl-5.39.0.exe',
    sublimepath => 'C:/temp/Sublime_setup.exe';
  }
}
define base::package($openofficesource = undef,
                     $maximapath = undef,
		     $sublimepath = undef ) {
  validate_string($openofficesource)
  validate_string($maximapath)
  validate_string($sublimepath)
    
  case $::osfamily {
  'RedHat': {
	package {'net-tools':
	ensure => $base::params::ensure;
  }
	package {'htop': ensure => $base::params::ensure;}
	file { '/etc/myfile':
	content => inline_template("Hello, my name is ${::hostname}")
	}
  }
  'Windows': {
  Package { provider => 'chocolatey', }	
  host { 'puppetmaster':
    ensure => $base::params::ensure,
    ip => '172.31.29.165';
    }
  package {
  'firefox':
    ensure => absent;
  'chromium':
    ensure => absent;
  'openoffice':
    ensure => latest;
  'git.install':
    ensure => latest,
    uninstall_options => ['--remove-dependencies'];
  'sublimetext2':
    ensure => latest;
  'nodejs.install':
    ensure => latest;
  }
  if $facts['hostname'] == 'EC2AMAZ-LEL3IUQ' {
  package {'docker-for-windows':
    ensure => latest;
    'docker':
    ensure => absent;
    }  
  }
  
  }
  
  }
}

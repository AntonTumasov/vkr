class base::files(){
case $osfamily {
  'RedHat': {
	file { '/etc/test': ensure => present,content => inline_template("Test") }
    }
  'Windows': {
     file {'C:\Users\Administrator\newfile.docx': 
          content => inline_template("Тест агента номер 2"),
          ensure => $base::params::ensure,
          require => File['C:\Users\Student\Desktop\zadanie.txt'];
        }
	file {'C:\Users\Student\Desktop\zadanie.txt':
           content => template("base/zadanie.txt"),
           owner => 'Administrator',
           group=>'Administrators',
           mode =>'0664', 
           ensure => $base::params::ensure,
           #require => File['C:\Users\Administrator\newfile.docx'];
        }
    } 
  }
}

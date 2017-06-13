class base::params(){
$ensure = $facts['os']['family'] ? {
    'Windows' => present,
    default => absent,
  }

}

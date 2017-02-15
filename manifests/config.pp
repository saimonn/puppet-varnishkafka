class varnishkafka::config {
  file { '/etc/varnishkafka.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/varnishkafka.conf.erb"),
    require => Class['varnishkafka::install'],
    notify  => Class['varnishkafka::service'],
  }
}

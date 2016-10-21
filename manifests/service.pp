class varnishkafka::service (
) {
  service { $::varnishkafka::service_name:
    ensure  => running,
    enable  => true,
    require => Class['varnishkafka::config'],
  }
}

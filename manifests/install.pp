class varnishkafka::install (
) {
  package { 'varnishkafka':
    ensure => present,
  }
}

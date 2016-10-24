class varnishkafka::params {
  $service_name       = 'varnishkafka'
  $log_syslog         = true
  $log_stderr         = false
  $log_errors         = true
  $kafka_broker_list  = [ 'localhost:9092' ]
  $kafka_retries      = 3
  $kafka_partition    = -1
  $kafka_buffer_len   = 1000000
  $kafka_require_acks = true
  $kafka_timeout      = 60000
  $kafka_topic        = 'logs'
  case $::operatingsystem {
    'Debian': {
      case $::operatingsystemmajrelease {
        '8': {
          $daemonize = false
        }
        default: {
          fail("unsupported OS version ${::operatingsystem}-${::operatingsystemmajrelease}")
        }
      }
    }
    'RedHat': {
      case $::operatingsystemmajrelease {
        '7': {
          $daemonize = false
        }
        default: {
          fail("unsupported OS version ${::operatingsystem}-${::operatingsystemmajrelease}")
        }
      }
    }
    'Ubuntu': {
      case $::operatingsystemmajrelease {
        '16.04': {
          $daemonize = false
        }
        default: {
          fail("unsupported OS version ${::operatingsystem}-${::operatingsystemmajrelease}")
        }
      }
    }
    default: {
      fail("unsupported OS ${::operatingsystem}")
    }
  }
}

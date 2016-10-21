class varnishkafka (
  $output_format_type,
  $output_format,
  $output_type,
  $daemonize          = $::varnishkafka::params::daemonize,
  $service_name       = $::varnishkafka::params::service_name,
  $log_syslog         = $::varnishkafka::params::log_syslog,
  $log_stderr         = $::varnishkafka::params::log_stderr,
  $log_errors         = $::varnishkafka::params::log_errors,
  $kafka_broker_list  = $::varnishkafka::params::kafka_broker_list,
  $kafka_retries      = $::varnishkafka::params::kafka_retries,
  $kafka_partition    = $::varnishkafka::params::kafka_partition,
  $kafka_buffer_len   = $::varnishkafka::params::kafka_buffer_len,
  $kafka_require_acks = $::varnishkafka::params::kafka_require_acks,
  $kafka_timeout      = $::varnishkafka::params::kafka_timeout,
  $kafka_topic        = $::varnishkafka::params::kafka_topic,
) inherits varnishkafka::params {

  validate_bool($log_syslog)
  validate_bool($log_stderr)
  validate_bool($log_errors)
  validate_bool($kafka_require_acks)

  validate_integer($kafka_retries)
  validate_integer($kafka_partition)
  validate_integer($kafka_buffer_len)
  validate_integer($kafka_timeout)

  validate_array($kafka_broker_list)

  validate_string($service_name)
  validate_string($kafka_topic)

  include ::varnishkafka::install
  include ::varnishkafka::config
  include ::varnishkafka::service
}

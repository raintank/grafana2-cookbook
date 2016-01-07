#
# Cookbook grafana2
# Copyright (c) 2015 Nordstrom, Inc.
#

### INSTALL ###
default['grafana']['user'] = 'grafana'
default['grafana']['group'] = 'grafana'
default['grafana']['conf_ini'] = '/etc/grafana/grafana.ini'
default['grafana']['repo_url'] = 'https://packagecloud.io'
default['grafana']['repo_name'] = 'raintank/raintank'
default['grafana']['version'] = '' # '2.0.2-1' If you really want to pin
default['grafana']['ssl_cert_file'] = '/etc/grafana/ssl.crt'
default['grafana']['ssl_key_file'] = '/etc/grafana/ssl.key'
default['grafana']['ssl_cert_content'] = nil
default['grafana']['ssl_key_content'] = nil
default['grafana']['instance_id'] = 'default'

### PATHS ###
default['grafana']['log_dir'] = '/var/log/grafana'
default['grafana']['data_dir'] = '/var/lib/grafana'
default['grafana']['static_root'] = 'public'

### SERVER ###

default['grafana']['port'] = '3000'
default['grafana']['protocol'] = 'http'
default['grafana']['domain'] = 'grafana2.example.com'
default['grafana']['app_mode'] = 'production'
default['grafana']['root_url'] = '%(protocol)s://%(domain)s:%(http_port)s/'
default['grafana']['router_logging'] = false
default['grafana']['enable_gzip'] = false

### DATABASE ###
## mysql
# default['grafana']['db_type'] = 'mysql' # Either mysql, postgres, or sqlite3
# default['grafana']['db_host'] = 'grafana2-mysql.example.com:3306' # ip/hostname:port
# default['grafana']['db_name'] = 'grafana'
# default['grafana']['db_user'] = 'grafana_user' # Only for mysql/postgres
# default['grafana']['db_password'] = 'SECRET'   # Only for mysql/postgres
## postgres
# default['grafana']['db_type'] = 'postgres' # Either mysql, postgres, or sqlite3
# default['grafana']['db_host'] = 'grafana2-postgres.example.com:5432' # ip/hostname:port
# default['grafana']['db_name'] = 'grafana'
# default['grafana']['db_user'] = 'grafana_user' # Only for mysql/postgres
# default['grafana']['db_password'] = 'SECRET'   # Only for mysql/postgres
# default['grafana']['ssl_mode'] = 'verify-full'     # Postgres only, either 'disable', 'require', or 'verify-full'
## sqlite3
default['grafana']['db_type'] = 'sqlite3' # Either mysql, postgres, or sqlite3
default['grafana']['db_file'] = 'grafana.db'
default['grafana']['db_name'] = 'grafana'

### AUTH.ANONYMOUS ###
default['grafana']['anon_enabled'] = 'true' # 'true' or 'false'
default['grafana']['org_name'] = 'Main Org.'
default['grafana']['org_role'] = 'Viewer'

### AUTH.PROXY ###
default['grafana']['auth_proxy']['enabled'] = false
default['grafana']['auth_proxy']['header_name'] = 'X-WEBAUTH-USER'
default['grafana']['auth_proxy']['header_property'] = 'username'
default['grafana']['auth_proxy']['auto_sign_up'] = true

### SMTP ###
default['grafana']['smtp']['enabled'] = false
default['grafana']['smtp']['host'] = ''
default['grafana']['smtp']['user'] = ''
default['grafana']['smtp']['password'] = ''
default['grafana']['smtp']['cert_file'] = ''
default['grafana']['smtp']['key_file'] = ''
default['grafana']['smtp']['skip_verify'] = false
default['grafana']['smtp']['from_address'] = 'admin@grafana.localhost'

### EMAIL ###
default['grafana']['email']['welcome_email'] = false
default['grafana']['email']['templates_pattern'] = 'emails/*.html'

### SESSION ###
default['grafana']['session_type'] = 'memory' # Either 'memory', 'file', 'mysql', or 'postgres'
# default['grafana']['session_type'] = 'mysql' # Either 'memory', 'file', 'mysql', or 'postgres'
default['grafana']['cookie_name'] = 'grafana_sess'
default['grafana']['cookie_secure'] = false
default['grafana']['session_life_time'] = 84600

### LOGGING ###
default['grafana']['log_level'] = 'Info' # Either "Trace", "Debug", "Info", "Warn", "Error", "Critical"
default['grafana']['log_level_console' ] = node['grafana']['log_level']
default['grafana']['log_level_file' ] = node['grafana']['log_level']
default['grafana']['log_mode'] = "console"
default['grafana']['log_formatting'] = true

### REPORTING ###
default['grafana']['reporting_enabled'] = true

### SECURITY ###
default['grafana']['admin_user'] = 'admin'
default['grafana']['admin_password'] = 'admin'
default['grafana']['secret_key'] = 'AAAABBBBBCCCC'
default['grafana']['login_remember_days'] = 7
default['grafana']['cookie_username'] = 'grafana_user'
default['grafana']['cookie_remember_name'] = 'grafana_remember'

### USERS ###
default['grafana']['allow_sign_up'] = true
default['grafana']['allow_org_create'] = true
default['grafana']['auto_assign_org'] = true
default['grafana']['auto_assign_org_role'] = node['grafana']['org_role']

### EVENT PUBLISHING
default['grafana']['event_publish'] = true
default['grafana']['rabbitmq_host'] = 'localhost'
default['grafana']['event_exchange'] = 'grafana_events'

### RAINTANK ###
default['grafana']['raintank'] = true
default['grafana']['graphite_host'] = 'localhost'
default['grafana']['graphite_port'] = 8888
default['grafana']['elasticsearch_host'] = 'localhost'
# TODO: there *has* to be a better way to specify this path.
default['grafana']['litmus_path'] = '/usr/share/grafana/public/plugins/raintank/dashboards/litmus'
default['grafana']['haproxy_search'] = "tags:haproxy AND chef_environment:#{node.chef_environment}"

### TELEMETRY
default['grafana']['use_statsd'] = false
default['grafana']['statsd_addr'] = "localhost:8125"
default['grafana']['statsd_type'] = "standard"

### PROFILING
default['grafana']['use_profiling'] = false
default['grafana']['profile_heap_mb'] = 4000
default['grafana']['profile_heap_dir'] = '/tmp/grafana-profile'
default['grafana']['profile_heap_wait'] = 3600

### ALERTING
default['grafana']['alerting']['enabled'] = false
default['grafana']['alerting']['handler'] = "amqp"
default['grafana']['alerting']['queue_ticks_size'] = 20
default['grafana']['alerting']['queue_jobs_size'] = 1000
default['grafana']['alerting']['pre_amqp_jobs_size'] = 1000
default['grafana']['alerting']['executor_lru_size'] = 10000
default['grafana']['alerting']['enable_scheduler'] = false
default['grafana']['alerting']['executors'] = 10
default['grafana']['alerting']['individual_alerts'] = false

### QUOTAS
default['grafana']['quota']['enabled'] = true
default['grafana']['quota']['org_user'] = 10
default['grafana']['quota']['org_dashboard'] = 100
default['grafana']['quota']['org_data_source'] = 10
default['grafana']['quota']['org_api_key'] = 10
default['grafana']['quota']['org_endpoint'] = 10
default['grafana']['quota']['org_collector'] = 10
default['grafana']['quota']['user_org'] = 10
default['grafana']['quota']['global_user'] = -1
default['grafana']['quota']['global_org'] = -1
default['grafana']['quota']['global_dashboard'] = -1
default['grafana']['quota']['global_data_source'] = -1
default['grafana']['quota']['global_api_key'] = -1
default['grafana']['quota']['global_endpoint'] = -1
default['grafana']['quota']['global_collector'] = -1
default['grafana']['quota']['global_session'] = -1

# METRICS PUBLISHING
default['grafana']['metric_publish_enabled'] = true
default['grafana']['metric_publish_nsqd_addr'] = "localhost:4150"
default['grafana']['metric_publish_topic'] = "metrics"

# COLLECTOR EVENTS PUBLISHING
default['grafana']['collector_event_publish_enabled'] = true
default['grafana']['collector_event_publish_nsqd_addr'] = "localhost:4150"
default['grafana']['collector_event_publish_topic'] = "probe_events"

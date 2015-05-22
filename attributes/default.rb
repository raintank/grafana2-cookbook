#
# Cookbook grafana2
# Copyright (c) 2015 Nordstrom, Inc.
#

### INSTALL ###
default['grafana']['user'] = 'grafana'
default['grafana']['group'] = 'grafana'
default['grafana']['conf_ini'] = '/etc/grafana/grafana.ini'
default['grafana']['repo_url'] = 'https://packagecloud.io'
default['grafana']['version'] = '' # '2.0.2-1' If you really want to pin
default['grafana']['ssl_cert_file'] = '/etc/grafana/ssl.crt'
default['grafana']['ssl_key_file'] = '/etc/grafana/ssl.key'
default['grafana']['ssl_cert_content'] = nil
default['grafana']['ssl_key_content'] = nil

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

### SESSION ###
default['grafana']['session_type'] = 'memory' # Either 'memory', 'file', 'mysql', or 'postgres'
# default['grafana']['session_type'] = 'mysql' # Either 'memory', 'file', 'mysql', or 'postgres'
default['grafana']['cookie_name'] = 'grafana_sess'
default['grafana']['cookie_secure'] = false
default['grafana']['session_life_time'] = 84600

### LOGGING ###
default['grafana']['log_level'] = 'Info' # Either "Trace", "Debug", "Info", "Warn", "Error", "Critical"

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
default['grafana']['litmus_path'] = '/go/src/github.com/grafana/grafana/public/plugins/raintank/dashboards/litmus'

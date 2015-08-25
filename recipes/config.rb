cert_file = cert_key = nil

node.default['grafana']['instance_id'] = node['hostname']

if node['grafana']['ssl_cert_content'] && node['grafana']['ssl_key_content']
  cert_file = node['grafana']['ssl_cert_file']
  cert_key = node['grafana']['ssl_key_file']
  file node['grafana']['ssl_cert_file'] do
    owner node['grafana']['user']
    group node['grafana']['group']
    mode '0600'
    content node['grafana']['ssl_cert_content']
    action :create
  end
  file node['grafana']['ssl_key_file'] do
    owner node['grafana']['user']
    group node['grafana']['group']
    mode '0600'
    content node['grafana']['ssl_key_content']
    action :create
  end
end

if node['grafana']['use_profiling']
  directory node['grafana']['profile_heap_dir'] do
    mode "0755"
    owner node['grafana']['user']
    group node['grafana']['group']
    action :create
  end
end

elasticsearch_host = find_haproxy || node['grafana']['elasticsearch_host']
db_host = find_haproxy || node['grafana']['db_host']
rabbitmq_host = find_haproxy || node['grafana']['rabbitmq_host']
graphite_host = find_haproxy || node['grafana']['graphite_host']

template node['grafana']['conf_ini'] do
  source 'grafana.ini.erb'
  mode '600'
  owner node['grafana']['user']
  group node['grafana']['group']
  variables({
    cert_file: cert_file,
    cert_key: cert_key,
    db_host: db_host,
    elasticsearch_host: elasticsearch_host,
    rabbitmq_host: rabbitmq_host,
    graphite_host: graphite_host
  })
  notifies :restart, 'service[grafana-server]', :delayed
end

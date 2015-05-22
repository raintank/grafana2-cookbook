cert_file = cert_key = nil

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

template node['grafana']['conf_ini'] do
  source 'grafana.ini.erb'
  mode '600'
  owner node['grafana']['user']
  group node['grafana']['group']
  variables({
    cert_file: cert_file,
    cert_key: cert_key
  })
  notifies :restart, 'service[grafana-server]', :delayed
end

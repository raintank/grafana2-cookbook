package_options = ''

platform_family = node['platform_family']
platform_version = node['platform_version'].to_i

# TODO: rpm packages will actually have to work someday

repo_type = case platform_family
when 'debian'
  "deb"
else
  "rpm"
end

packagecloud_repo node['grafana']['repo_name'] do
  type repo_type
end

pkg_action = if node['grafana']['version'].nil?
  :upgrade
else
  :install
end

case platform_family
when 'debian'
  package 'grafana' do
    version node['grafana']['version']
    options package_options
    action pkg_action
  end
else
  yum_package 'grafana' do
    version node['grafana']['version']
    options package_options
    allow_downgrade true
    action pkg_action
  end
end

# Update after pkg install until this PR is added into a release
# https://github.com/grafana/grafana/pull/2115
cookbook_file '/etc/init.d/grafana-server' do
  owner 'root'
  group 'root'
  mode '0755'
end

#
# Cookbook Name:: grafana2
# Library: helpers
#
# Copyright (C) 2015 Raintank, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This is rather GCE specific right now, and cribbed from the raintank_stack
# cookbook.

module Grafana2
  module Helpers
    def find_haproxy
      return nil? unless node.attribute?('gce')
      zone = node['gce']['instance']['zone']
      haproxy = search("node", node['grafana']['haproxy_search'])
      h = haproxy.select { |h| h['gce']['instance']['zone'] == zone }.first
      return (h) ? h.ipaddress : nil
    end
  end
end

Chef::Recipe.send(:include, ::Grafana2::Helpers)
Chef::Resource.send(:include, ::Grafana2::Helpers)
Chef::Provider.send(:include, ::Grafana2::Helpers)

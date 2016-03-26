#
# Copyright (c) 2015 Nordstrom, Inc.
#
# Originally created from Nordstrom Cookbook Template v0.16.2
#

name             'grafana2'
maintainer       'Nordstrom, Inc.'
maintainer_email 'techinfraperfmet@nordstrom.com'
license          'Apache 2.0'
description      'Installs/Configures grafana2'
version          '0.2.5'
issues_url       'https://github.com/Nordstrom/grafana2-cookbook/issues'
source_url       'https://github.com/Nordstrom/grafana2-cookbook'

depends          'yum'
depends          'apt'
depends 'packagecloud', '~> 0.1.0'

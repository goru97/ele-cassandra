name             'ele-cassandra'
maintainer       'Gaurav Bajaj'
maintainer_email 'gaurav.bajaj@rackspace.com'
license          'Rackspace'
description      'Installs/Configures ele-cassandra'
long_description 'Installs/Configures ele-cassandra'
version          '0.1.0'
depends          'cassandra-dse'
depends          'python'
depends          'apt'
depends          'java'

if respond_to?(:source_url)
  source_url 'https://github.com/mmi-cookbooks/ele-cassandra'
end
if respond_to?(:issues_url)
  issues_url 'https://github.com/mmi-cookbooks/ele-cassandra/issues'
end
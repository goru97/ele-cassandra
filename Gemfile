# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.6.3"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

source 'https://rubygems.org'

group :integration do
  gem 'test-kitchen'
end

group :integration_vagrant do
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end

gem 'rake'

group :spec do
  gem 'berkshelf'
  gem 'chefspec'
  gem 'serverspec'
end

group :style do
  gem 'foodcritic'
  gem 'rubocop'
end

group :integration_rackspace do
  gem 'kitchen-rackspace'
end

group :coverage do
  gem 'coveralls'
end

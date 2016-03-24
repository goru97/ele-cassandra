require 'serverspec'

# Set backend type
set :backend, :exec

at_exit { ChefSpec::Coverage.report! }

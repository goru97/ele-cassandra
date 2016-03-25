[![Build Status](https://travis-ci.org/mmi-cookbooks/ele-cassandra.svg?branch=master)](https://travis-ci.org/mmi-cookbooks/ele-cassandra)
[![Build Status](https://circleci.com/gh/mmi-cookbooks/ele-cassandra.svg?style=svg)](https://circleci.com/gh/mmi-cookbooks/ele-cassandra)
[![Coverage Status](https://coveralls.io/repos/github/mmi-cookbooks/ele-cassandra/badge.svg?branch=master)](https://coveralls.io/github/mmi-cookbooks/ele-cassandra?branch=master)

# ele-cassandra-cookbook

A wrapper cookbook around cassandra-dse cookbook.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ele-cassandra']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### ele-cassandra::default

Include `ele-cassandra` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ele-cassandra::default]"
  ]
}
```

## License and Authors

Author:: Gaurav Bajaj (gaurav.bajaj@rackspace.com)


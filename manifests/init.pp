# == Class: puppetlint
#
# This class sets up puppet-lint
#
# Currently functionality is limited to installing or removing the package.
#
# == Parameters
#
# [*manage*]
#   Whether to manage puppet-lint using Puppet. Valid values 'yes' (default) and 
#   'no'.
# [*ensure*]
#   Status of puppet-lint. Valid values 'present' (default) and 'absent'.
# [*provider*]
#   Package provider to use. Defaults to undef, but you may want to switch this 
#   to 'gem' if you're using exotic puppet-lint plugins.
# [*p4plugins*]
#   Status of puppet-lint plugins that test for Puppet 4 compatibility. Valid 
#   values are 'present' and 'absent' (default). Note that these plugins are 
#   only available as gems, so the gem version of puppet-lint will get pulled in 
#   as a dependency regardless of the value of $provider.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class puppetlint
(
    $manage = 'yes',
    $ensure = 'present',
    $provider = undef,
    $p4plugins = 'absent'

) inherits puppetlint::params
{

if $manage == 'yes' {

    # On Puppet 4 server Ruby might actually not be installed, and the gem 
    # provider would fail
    include ::ruby

    class { '::puppetlint::install':
        ensure   => $ensure,
        provider => $provider,
    }

    class { '::puppetlint::install::p4plugins':
        ensure => $p4plugins,
    }
}
}

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
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class puppetlint
(
    $manage = 'yes',
    $ensure = 'present'

) inherits puppetlint::params
{

if $manage == 'yes' {

    class { '::puppetlint::install':
        ensure => $ensure,
    }
}
}

# == Class: puppetlint::install
#
# This class installs puppetlint
#
class puppetlint::install
(
    $ensure

) inherits puppetlint::params
{
    package { $::puppetlint::params::package_name:
        ensure => $ensure,
    }
}

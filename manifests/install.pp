# == Class: puppetlint::install
#
# This class installs puppetlint
#
class puppetlint::install
(
    $ensure,
    $provider

) inherits puppetlint::params
{

    # Determine what the package name should be
    $active_package_name = $provider ? {
        'gem'   => $::puppetlint::params::gem_package_name,
        default => $::puppetlint::params::package_name,
    }

    package { $active_package_name:
        ensure   => $ensure,
        provider => $provider,
    }
}

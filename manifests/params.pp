#
# == Class: puppetlint::params
#
# Defines some variables based on the operating system
#
class puppetlint::params {

    $gem_package_name = 'puppet-lint'

    case $::osfamily {
        'Debian': {
            $package_name = 'ruby-puppet-lint'
        }
        'RedHat': {
            $package_name = 'rubygem-puppet-lint'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}

#
# == Class: puppetlint::params
#
# Defines some variables based on the operating system
#
class puppetlint::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'ruby-puppet-lint'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}

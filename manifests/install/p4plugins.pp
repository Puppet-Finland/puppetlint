#
# == Class: puppetlint::install::p4plugins
#
# Install puppet-lint plugins for verifying Puppet code's compatibility with 
# Puppet 4. The list of plugins is taken from here:
#
# <http://www.camptocamp.com/en/actualite/getting-code-ready-puppet-4/>
#
# The plugins are only available as gems.
#
class puppetlint::install::p4plugins
(
    $ensure
)
{

    Package {
        ensure => $ensure,
        provider => 'gem',
    }

    package { 'puppet-lint-unquoted_string-check': }
    package { 'puppet-lint-empty_string-check': }
    package { 'puppet-lint-leading_zero-check': }
    package { 'puppet-lint-variable_contains_upcase': }
    package { 'puppet-lint-spaceship_operator_without_tag-check': }
    package { 'puppet-lint-absolute_classname-check': }
    package { 'puppet-lint-undef_in_function-check': }
    package { 'puppet-lint-roles_and_profiles-check': }
}

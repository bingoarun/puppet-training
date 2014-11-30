#include apache::mod::php
class wordpress-site (
  $document_root = '/var/www/html/mysite',
) {
  #####33333333333333333333
  #service {'apache2':
  #  ensure=> running,
  #}
  file {'/var/www/html/':
    ensure => directory,
  }
  file {'/var/www/html/mysite':
    ensure  =>directory,
  #  source  =>"puppet:///modules/lvmguide/lvmguide",
    recurse =>true,
  }
  ##########################
  # Manage apache, the files for the website will be 
  # managed by the quest tool
  
  class { 'apache': 
    mpm_module => 'prefork'
  }
  include apache::mod::php
  include apache::mod::mysql
  #apache::vhost { 'learning.puppetlabs.vm':
  #  port    => $port,
  #  docroot => $document_root,
  #}
  class { '::mysql::server':
    root_password    => 'password',
    override_options => $override_options
  } 
  class {'wordpress':
    install_dir => $document_root,
  }
  
}

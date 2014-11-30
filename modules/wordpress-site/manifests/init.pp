class wordpress-site (
  $document_root = '/var/www/html/lvmguide',
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
  
  #class { 'apache': 
  #  default_vhost => false,
  #}
  #apache::vhost { 'learning.puppetlabs.vm':
  #  port    => $port,
  #  docroot => $document_root,
  #}
  class {'wordpress':
    install_dir => '/var/www/html/mysite',
  }
  
}

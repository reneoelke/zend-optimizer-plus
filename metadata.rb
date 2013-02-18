name              "zend-optimizer-plus"
maintainer        "foobugs Oelke & Eichner GbR"
maintainer_email  "mail@foobugs.com"
license           "Apache 2.0"
description       "Installs and configures PHP extension ZendOptimizerPlus"
version           "1.0.0"

depends "apt"
depends "php"
depends "build-essential"

recipe "zend-optimizer-plus", "Installs Zend Optimizer+"
recipe "zend-optimizer-plus::source", "Installs Zend Optimizer+ from source"

%w{ ubuntu }.each do |os|
  supports os
end

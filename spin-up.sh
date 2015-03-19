#!/usr/bin/env bash

if [ ! -e ./gingerbreadman-sightings.org ]; then
    git clone https://github.com/gingerbreadman-sightings-org/gingerbreadman-sightings.org
fi

vagrant up
vagrant ssh -c "if [ ! -e /var/www/gingerbreadman-sightings.org/app/config/parameters.yml ]; then cp /var/www/spin-up-files/parameters.yml /var/www/gingerbreadman-sightings.org/app/config/parameters.yml; fi;"
vagrant ssh -c "cd /var/www/gingerbreadman-sightings.org/ && composer install"
vagrant ssh -c "cd /var/www/gingerbreadman-sightings.org/ && app/console doctrine:migrations:migrate"

#! /usr/bin/env bash

cd /var/www/hyrax/current/
set -o allexport; source /var/www/hyrax/.env; set +o allexport
(echo -n "$(date --rfc-3339=seconds) " && /usr/local/bin/bundle exec rails calstate:all_files_fixity_check && echo "success" || echo "failure") >> /var/log/hyrax/fixitycheck.log 2>&1

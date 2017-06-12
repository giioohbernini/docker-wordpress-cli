# /#/#/ - /#/#/ Repositories /#/#/ - /#/#/
#
# Docker Hub => https://hub.docker.com/r/giioohbernini/docker-wordpress/
# Github => https://github.com/giioohbernini/docker-wordpress-cli

FROM wordpress:latest

COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini
COPY wp-su.sh /bin/wp

# Add sudo in order to run wp-cli as the www-data user 
# Add WP-CLI 
# Cleanup
RUN \
  rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini && \
  apt-get update && apt-get install -y sudo less && \
  curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x /bin/wp-cli.phar /bin/wp && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

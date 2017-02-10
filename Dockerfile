# /#/#/ - /#/#/ Repositories /#/#/ - /#/#/
#
# Docker Hub => https://hub.docker.com/r/giioohbernini/docker-wordpress/
# Github => https://github.com/giioohbernini/docker-wordpress-cli

FROM wordpress:latest

RUN rm -rf /usr/local/etc/php/conf.d/opcache-recommended.ini

COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y sudo less

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
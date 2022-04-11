FROM drupal:8.8.2

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
# the "rm -rf" command will clean up the cache used by the apt-get

WORKDIR /var/www/html/themes
RUN git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupalcode.org/project/bootstrap.git \ 
&& chown -R www-data:www-data bootstrap
# all commands are run as root, so use chown to change permissions

WORKDIR /var/www/html
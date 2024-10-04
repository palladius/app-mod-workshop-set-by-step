# copied from https://www.cloudways.com/blog/docker-php-application/

COPY php.ini /usr/local/etc/php/
RUN apt-get update && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev mysql-client \
&& docker-php-ext-install pdo mysql mysql1 gd iconv \ && docker-php-ext-install mbstring \
&& docker-php-ext-install mcrypt
COPY /blogsite.com.conf
COPY./hosts/etc/hosts
/etc/apache2/sites-available/
RUN a2enmod rewrite
#RUN a2enmod mcrypt
RUN service apache2 restart
WORKDIR /etc/apache2/sites-available/
RUN a2ensite blogsite.com.conf
EXPOSE 80

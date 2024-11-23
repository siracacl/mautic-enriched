#use original mautic docker apache
FROM mautic/mautic:5.1.1-apache

# Installiere Composer, Nano und Telnet
RUN apt-get update && apt-get install -y \
    nano \
    telnet \
    curl \
    unzip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#set working dir as in original
WORKDIR /var/www/html

#expose 80 as in original
EXPOSE 80

#entrypoint and cmd as in original
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]

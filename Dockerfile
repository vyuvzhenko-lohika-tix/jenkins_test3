FROM alpine

 ENV TZ=Europe/Kiev



 RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apk update && apk add apache2 php
 RUN rm -rf /var/www/html/index.html

 COPY src/index.php /var/www/html

 EXPOSE 80

 CMD ["apachectl", "-D", "FOREGROUND"]

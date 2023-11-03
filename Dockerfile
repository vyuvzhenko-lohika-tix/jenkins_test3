FROM alpine

 ENV TZ=Europe/Kiev

 ARG DEBIAN_FRONTEND=noninteractive
 RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apk update && apk add apache2 php82-apache2
 RUN rm -rf /var/www/html/index.html

 COPY src/index.php /var/www/html

 EXPOSE 8088

 CMD ["httpd", "-D", "FOREGROUND"]

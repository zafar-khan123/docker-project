FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page79/the-new-audi.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip the-new-audi.zip
RUN cp -rvf the-new-audi/* .
RUN rm -rf the-new-audi the-new-audi.zip
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]
EXPOSE 80

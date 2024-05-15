FROM httpd
MAINTAINER "Sachin Yadav"
RUN apt-get update -y
RUN apt-get install apache2 apache2-utils net-tools vim wget  zip unzip -y
ADD https://github.com/sachin78y/files/raw/main/picstudio.zip /usr/local/apache2/htdocs
WORKDIR /usr/local/apache2/htdocs
RUN unzip  /usr/local/apache2/htdocs/picstudio.zip
RUN cp -rf picstudio-html/* /usr/local/apache2/htdocs
RUN rm -rvf picstudio-html/* neogym.zip
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80

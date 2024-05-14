FROM httpd
MAINTAINER "Sachin Yadav"
RUN apt-get update -y
RUN apt-get install apache2 apache2-utils net-tools vim wget  zip unzip -y
ADD https://raw.githubusercontent.com/sachin78y/files/main/neogym.zip /usr/local/apache2/htdocs
WORKDIR /usr/local/apache2/htdocs
RUN unzip  /usr/local/apache2/htdocs/neogym.zip
RUN cp -rf neogym-html/* /usr/local/apache2/htdocs
RUN rm -rvf neogym-html/* neogym.zip
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80

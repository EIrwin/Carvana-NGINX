FROM nginx

RUN apt-get update && apt-get install -y \
  nano

RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled


COPY nginx.conf /etc/nginx/nginx.conf

COPY sites-available/a /etc/nginx/sites-available/a
COPY sites-available/b /etc/nginx/sites-available/b

RUN ln -s /etc/nginx/sites-available/a /etc/nginx/sites-enabled/a
RUN ln -s /etc/nginx/sites-available/b /etc/nginx/sites-enabled/b


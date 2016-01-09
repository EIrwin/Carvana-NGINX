FROM nginx

RUN apt-get update && apt-get install -y \
  nano

RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled


COPY ssl/swervemobile.crt /etc/ssl/swervemobile.crt
COPY ssl/swervemobile.key /etc/ssl/swervemobile.key
COPY ssl/swervemobile.csr /etc/ssl/swervemobile.csr

COPY nginx.conf /etc/nginx/nginx.conf

COPY sites-available/swerve /etc/nginx/sites-available/swerve
COPY sites-available/vendor /etc/nginx/sites-available/vendor
COPY sites-available/socket /etc/nginx/sites-available/socket
COPY sites-available/signalr /etc/nginx/sites-available/signalr

RUN ln -s /etc/nginx/sites-available/swerve /etc/nginx/sites-enabled/swerve
RUN ln -s /etc/nginx/sites-available/vendor /etc/nginx/sites-enabled/vendor
RUN ln -s /etc/nginx/sites-available/socket /etc/nginx/sites-enabled/socket
RUN ln -s /etc/nginx/sites-available/signalr /etc/nginx/sites-enabled/signalr

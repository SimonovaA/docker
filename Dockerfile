FROM nginx
RUN mkdir -p /var/www/sim.com/images
RUN chmod -R 754 /var/www/sim.com && \
useradd nastya && \
groupadd simsim
RUN usermod -G simsim nastya && \
chown -R nastya:simsim /var/www/sim.com && \ 
sed -i 's#/usr/share/nginx/html#/var/www/sim.com#g' /etc/nginx/conf.d/default.conf &&\
sed -i 's/user  nginx/user nastya/g' /etc/nginx/nginx.conf
COPY ./index.html /var/www/sim.com



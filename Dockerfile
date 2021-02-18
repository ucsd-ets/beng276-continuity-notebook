FROM cmrglab/cont_release_vnc

# per david - comment out ADD stmt below and add following;
# this containers supervisor.conf runs all 6 processes
#RUN chmod 777 /etc/supervisor/conf.d/supervisord.conf
RUN useradd -u 58585 jis269
RUN chmod -R og+rwX /etc/nginx /etc/supervisor /root /var/log /var/run /var/lib/nginx /usr/local/bin/
#RUN touch /var/log/supervisor/supervisord.log
ADD startup.sh /
ADD supervisord.conf /etc/supervisor/conf.d
#ADD supervisord.conf /etc/x11vnc.pass

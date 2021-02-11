FROM cmrglab/cont_release_vnc

# per david - comment out ADD stmt below and add following;
# this containers supervisor.conf runs all 6 processes
#RUN chmod 777 /etc/supervisor/conf.d/supervisord.conf
RUN chmod -R og+rwX /etc/nginx /etc/supervisor /root
ADD startup.sh /
ADD supervisord.conf /etc/supervisor/conf.d
#ADD supervisord.conf /etc/x11vnc.pass

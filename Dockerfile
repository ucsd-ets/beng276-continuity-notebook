FROM cmrglab/cont_release_vnc

ADD startup.sh /
ADD default /etc/nginx/sites-enabled
ADD supervisord.conf /etc/supervisor/conf.d

RUN useradd -u 58585 jis269 && \
    useradd -u 68744 dta001 && \
    useradd -u 142 pjamason && \
    chmod -R og+rwX /etc/nginx /etc/supervisor /root /var/log /var/run /var/lib/nginx /usr/local/bin/

FROM cmrglab/cont_release_vnc

ADD startup.sh /
ADD default /etc/nginx/sites-enabled
ADD supervisord.conf /etc/supervisor/conf.d

RUN useradd -u 58585 jis269 && \
    useradd -u 68744 dta001 && \
    useradd -u 142 pjamason && \
    useradd -u 41135 aperley && \
    useradd -u 11966 arw020 && \
    useradd -u 30216 ateitgen && \
    useradd -u 8333 eboyd && \
    useradd -u 1009974 ghuber && \
    useradd -u 105661 grader-beng276-01 && \
    useradd -u 92712 ideveci && \
    useradd -u 47369 jbli && \
    useradd -u 91393 k1garcia && \
    useradd -u 31879 kpvincen && \
    useradd -u 61790 m1hock && \
    useradd -u 88078 mbraza && \
    useradd -u 20921 mkbell && \
    useradd -u 7227 ramaro && \
    useradd -u 9999999 rkonecny && \
    useradd -u 18554 s3jain && \
    useradd -u 46958 sjp038 && \
    useradd -u 19647 shc131 && \
    useradd -u 31255 s7hernan && \
    useradd -u 1002977 tsejnowski && \
    useradd -u 8385 w5lu && \
    useradd -u 94457 zyi && \
    chmod -R og+rwX /etc/nginx /etc/supervisor /root /var/log /var/run /var/lib/nginx /usr/local/bin/


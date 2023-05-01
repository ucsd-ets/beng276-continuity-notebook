FROM cmrglab/cont_release_vnc:latest
ADD file:a58c8b447951f9e30c92e7262a2effbb8b403c2e795ebaf58456f096b5b2a720 in /
RUN /bin/sh -c [ -z "$(apt-get indextargets)" ]
RUN /bin/sh -c set -xe          \
    && echo '#!/bin/sh' > /usr/sbin/policy-rc.d         \
    && echo 'exit 101' >> /usr/sbin/policy-rc.d         \
    && chmod +x /usr/sbin/policy-rc.d           \
    && dpkg-divert --local --rename --add /sbin/initctl     \
    && cp -a /usr/sbin/policy-rc.d /sbin/initctl        \
    && sed -i 's/^exit.*/exit 0/' /sbin/initctl             \
    && echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
\
    && echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean                  \    && echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean          \    && echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean
\
    && echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages
\
    && echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes
\
    && echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests
RUN /bin/sh -c mkdir -p /run/systemd \
    && echo 'docker' > /run/systemd/container
CMD ["/bin/bash"]
RUN /bin/sh -c sed -i 's#http://archive.ubuntu.com/ubuntu/#mirror://mirrors.ubuntu.com/mirrors.txt#' /etc/apt/sources.list;
ENV DEBIAN_FRONTEND=noninteractive
RUN /bin/sh -c apt update     \
    && apt install -y --no-install-recommends software-properties-common curl apache2-utils     \
    && apt update     \
    && apt install -y --no-install-recommends --allow-unauthenticated         supervisor nginx sudo net-tools zenity xz-utils         dbus-x11 x11-utils alsa-utils         mesa-utils libgl1-mesa-dri     \
    && apt autoclean -y     \
    && apt autoremove -y     \
    && rm -rf /var/lib/apt/lists/*
RUN /bin/sh -c apt update     \
    && apt install -y --no-install-recommends --allow-unauthenticated         xvfb x11vnc         vim-tiny firefox ttf-ubuntu-font-family ttf-wqy-zenhei      \
    && apt autoclean -y     \
    && apt autoremove -y     \
    && rm -rf /var/lib/apt/lists/*
RUN /bin/sh -c apt update     \
    && apt install -y gpg-agent     \
    && curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb     \
    && (dpkg -i ./google-chrome-stable_current_amd64.deb || apt-get install -fy)     \
    && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add     \
    && rm google-chrome-stable_current_amd64.deb     \
    && rm -rf /var/lib/apt/lists/*
RUN /bin/sh -c apt update     \
    && apt install -y --no-install-recommends --allow-unauthenticated         lxde gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme     \
    && apt autoclean -y     \
    && apt autoremove -y     \
    && rm -rf /var/lib/apt/lists/*
ARG TINI_VERSION=v0.18.0
ADD 11c0b0c43c7c51af4e3d83ce690cf81fa725f41177fe930411b5abe7822fba28 in /bin/tini
RUN |1 TINI_VERSION=v0.18.0 /bin/sh -c chmod +x /bin/tini
RUN |1 TINI_VERSION=v0.18.0 /bin/sh -c apt update     \
    && apt install -y --no-install-recommends --allow-unauthenticated         ffmpeg     \
    && rm -rf /var/lib/apt/lists/*     \
    && mkdir /usr/local/ffmpeg     \
    && ln -s /usr/bin/ffmpeg /usr/local/ffmpeg/ffmpeg
COPY file:abdf97ac11ee9706394713c0ecc1f055b664382f5465e60b5bf2c40a32c67163 in /tmp/
RUN |1 TINI_VERSION=v0.18.0 /bin/sh -c apt-get update     \
    && dpkg-query -W -f='${Package}\n' > /tmp/a.txt     \
    && apt-get install -y python3-pip python3-dev build-essential                                                                                                                                  \    && pip3 install setuptools wheel \
    && pip3 install -r /tmp/requirements.txt     \
    && ln -s /usr/bin/python3 /usr/local/bin/python     \
    && dpkg-query -W -f='${Package}\n' > /tmp/b.txt     \
    && apt-get remove -y `diff --changed-group-format='%>' --unchanged-group-format='' /tmp/a.txt /tmp/b.txt | xargs`     \
    && apt-get autoclean -y     \
    && apt-get autoremove -y     \
    && rm -rf /var/lib/apt/lists/*     \
    && rm -rf /var/cache/apt/* /tmp/a.txt /tmp/b.txt
LABEL maintainer=fcwu.tw@gmail.com
COPY dir:184340839665a9f0352b52da2062de99230a993526fbe387210d3322dafc1375 in /usr/local/lib/web/frontend/
COPY dir:69e8963095a14e9feb929e0abb46f28f2e86bcadb86757cd341932d4938b26e6 in /
RUN /bin/sh -c ln -sf /usr/local/lib/web/frontend/static/websockify /usr/local/lib/web/frontend/static/novnc/utils/websockify \
    &&  chmod +x /usr/local/lib/web/frontend/static/websockify/run
EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu SHELL=/bin/bash
HEALTHCHECK &{["CMD-SHELL" "curl --fail http://127.0.0.1:6079/api/health"] "30s" "5s" "0s" '\x00'}
ENTRYPOINT ["/startup.sh"]
RUN /bin/sh -c apt-get update     \
    && apt-get upgrade -y     \
    && apt-get install -y     build-essential     ca-certificates     gcc     git     libpq-dev     make     python2.7     libglu1     autoconf     swig     filezilla     \
    && apt-get autoremove     \
    && apt-get clean
ADD dir:1779fcc0c99789b8cd52534615eee01316f1bae24b1d54df93481e2775843586 in continuity
WORKDIR /root/continuity
RUN /bin/bash -c ./setup; source mglinit; autoconf; ./configure;

FROM cmrglab/cont_release_vnc:latest AS continuity

FROM ghcr.io/ucsd-ets/pilot-vnc-desktop:remove-webproxy-patch
USER root

COPY --from=continuity /root/continuity /opt/continuity

RUN apt-get update && \
#    apt-get upgrade -y && \
    apt-get install -yq \
      build-essential \
      ca-certificates \
      gcc \
      git \
      libpq-dev \
      make \
      python2.7 \
      libglu1 \
      autoconf \
      swig \
      filezilla
#    && apt-get autoremove     \
#    && apt-get clean
    
WORKDIR /opt/continuity
RUN /bin/bash -c ./setup && \
  source mglinit && \
  autoconf && \
  ./configure && \
  chown -R jovyan /opt/continuity

USER jovyan

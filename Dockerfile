FROM cmrglab/cont_release_vnc:latest AS continuity

FROM ghcr.io/ucsd-ets/pilot-vnc-desktop:remove-webproxy-patch
USER root

COPY --from=continuity /root/continuity /opt/continuity

WORKDIR /opt/continuity
RUN /bin/bash -c ./setup && \
  source mglinit && \
  autoconf && \
  ./configure && \
  chown -R jovyan /opt/continuity

USER jovyan

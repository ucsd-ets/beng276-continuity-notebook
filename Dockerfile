FROM cmrglab/cont_release_vnc:latest AS continuity

FROM ghcr.io/ucsd-ets/pilot-vnc-desktop:remove-webproxy-patch
COPY --from=continuity /root/continuity /opt/continuity

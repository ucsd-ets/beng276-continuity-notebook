FROM ghcr.io/ucsd-ets/pilot-vnc-desktop:remove-webproxy-patch
USER root


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
    
    
RUN fileid="1InDDqs_626fEHMMB4tJujGVhM_ED-UWz" && \
    cd /opt/ && \
    filename="OldContLinux.zip" && \
    html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"` && \
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename} && \ 
    unzip OldContLinux.zip -d continuity && \
    rm -f OldContLinux.zip && \
    ls -l /opt/continuity && \
    chmod -R 777 /opt/continuity
    

    

WORKDIR /opt/continuity/Continuity 

RUN cd /opt/continuity/Continuity && \
    ./continuitySetup.sh 
#  source mglinit && \
#  autoconf && \
#  ./configure && \
#  chown -R jovyan /opt/continuity

USER jovyan

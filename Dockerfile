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
    unzip OldContLinux.zip -d /opt/ && \
    rm -f OldContLinux.zip && \
    ls -l /opt/Continuity && \
    chmod -R 777 /opt/Continuity
    

    

WORKDIR /opt/Continuity 

RUN cd /opt/Continuity && \
    ./continuitySetup.sh && \
    
    # Download Example Files
    # Standard Model
    filename="sheet2304.cont6" && \
    fileid="1y_wezO54wgfJLD3RkMdr2pGfUOKuVAuq" && \
    html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"` && \
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename} && \ 
    # Spiral Model
    filename="sheet2304_spiral.cont6" && \
    fileid="1kYsk32CxMurY0eeEiff6vZ3epEpK9n_Z" && \
    html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"` && \
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename} 
    
    
    
#  source mglinit && \
#  autoconf && \
#  ./configure && \
#  chown -R jovyan /opt/continuity

USER jovyan

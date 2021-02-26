FROM debian:latest

COPY lachesis.tar.gz /lachesis.tar.gz

# Requirements
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt update \
  && apt install -y \
    apt-utils \
    build-essential \
    autoconf \
    wget \
    zlib1g-dev \
    libncurses-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-thread-dev \
    libboost-regex-dev \
  && apt clean

# Building Samtools
RUN wget https://github.com/samtools/samtools/archive/0.1.19.tar.gz \
  && tar -xvf 0.1.19.tar.gz \
  && cd samtools-0.1.19 \
  && make \
  && rm -rf /0.1.19.tar.gz 
  
RUN export LACHESIS_SAMTOOLS_DIR=/samtools-0.1.19 \
  && export C_INCLUDE_PATH=/samtools-0.1.19 \
  && export CPLUS_INCLUDE_PATH=/samtools-0.1.19 \
  && export LIBRARY_PATH=/samtools-0.1.19 \
  && tar -xvf /lachesis.tar.gz \
  && cd /shendurelab-LACHESIS-2e27abb \
  && ./configure \
  && sed -i -E 's/bam\///' src/include/gtools/SAMStepper.* \
  && make \
  && make install \
  && rm -rf /lachesis.tar.gz /shendurelab-LACHESIS-2e27abb /samtools-0.1.19 \
  && cd

ENTRYPOINT ["Lachesis"]

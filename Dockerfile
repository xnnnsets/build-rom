FROM ubuntu:20.04

# Install dependencies for building LineageOS
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk git-core gnupg flex bison gperf \
    build-essential zip curl zlib1g-dev gcc-multilib \
    g++-multilib libc6-dev-i386 lib32ncurses5-dev \
    x11proto-core-dev libx11-dev lib32z1-dev \
    libgl1-mesa-dev libxml2-utils xsltproc \
    unzip fontconfig rsync ccache lz4 make

# Install repo tool
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo && \
    chmod a+x /usr/local/bin/repo

# Set default JDK version to 11
RUN update-alternatives --set java /usr/lib/jvm/java-11-openjdk-amd64/bin/java

# Set work directory
WORKDIR /workspace

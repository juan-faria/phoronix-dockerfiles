FROM debian:bookworm-slim

# Set the working directory
WORKDIR /home

ENV OUTPUT_DIR=/mnt/output

# Create the output directory
RUN mkdir -p $OUTPUT_DIR

# Install phoronix-test-suite dependencies
RUN apt-get update && \
    apt-get install -y wget unzip php-cli php-xml build-essential autoconf mesa-utils vulkan-tools apt-file && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install the phoronix-test-suite
RUN wget https://github.com/phoronix-test-suite/phoronix-test-suite/archive/refs/heads/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv phoronix-test-suite-master phoronix-test-suite && \
    chmod +x phoronix-test-suite/install-sh && \
    cd phoronix-test-suite && \
    ./install-sh && \
    cd .. && \
    rm -rf phoronix-test-suite

COPY ./user-config.xml /etc/phoronix-test-suite.xml

# Install the phoronix-test-suite for iozone
RUN phoronix-test-suite batch-install iozone

COPY ./custom-suites /var/lib/phoronix-test-suite/test-suites/local

CMD ["phoronix-test-suite", "batch-benchmark", "iospeed-4kb-2mb"]

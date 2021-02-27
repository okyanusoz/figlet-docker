# We need to use the Python Docker image which uses Debian here to build a static Figlet binary because for some reason GCC doesn't like building Figlet in Alpine.
# Python is for staticx(this makes a clean, static binary)
FROM python:3.9-slim AS builder

# Install build-essential, wget, binutils and patchelf
RUN apt update && \
    apt install build-essential wget binutils patchelf -y

# Install staticx
RUN pip install staticx

# Get source code tarball of Figlet 2.2.5
RUN wget http://ftp.figlet.org/pub/figlet/program/unix/figlet-2.2.5.tar.gz -O /tmp/figlet.tar.gz

# Untar source code to /usr/src and delete source code tarball
WORKDIR /usr/src/
RUN tar xvf /tmp/figlet.tar.gz && \
    rm /tmp/figlet.tar.gz

WORKDIR /usr/src/figlet-2.2.5

# Compile figlet!
RUN make figlet

# Make static binary
RUN staticx figlet figlet

FROM scratch

# Copy binary and fonts

WORKDIR /bin
COPY --from=builder /usr/src/figlet-2.2.5/figlet .

WORKDIR /usr/local/share/figlet
COPY --from=builder /usr/src/figlet-2.2.5/fonts .

# Create /tmp directory (figlet needs this)
WORKDIR /tmp

ENTRYPOINT ["figlet"]

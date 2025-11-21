FROM debian:stable-slim

# Install basic tools
RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
        git sudo build-essential vim parted \
        quilt coreutils qemu-user-static debootstrap zerofree zip dosfstools e2fsprogs\
        libarchive-tools libcap2-bin rsync grep udev xz-utils curl xxd file kmod bc \
        binfmt-support ca-certificates fdisk gpg pigz arch-test \
        #libcups2-dev usbutils libusb-1.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (recommended for VS Code)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && usermod -aG sudo $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME

USER $USERNAME

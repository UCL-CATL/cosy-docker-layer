FROM fedora:25
MAINTAINER Sébastien Wilmet

RUN dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && \
	dnf -y upgrade && \
	dnf -y group install "Basic Desktop" && \
	dnf -y group install "C Development Tools and Libraries" && \
	dnf clean all

# This RUN command is more subject to change, so keep it separate from the
# previous RUN command, to benefit from the cache.
RUN dnf -y install \
		git \
		redhat-rpm-config && \
	dnf clean all

# Set default command
CMD ["/usr/bin/bash"]

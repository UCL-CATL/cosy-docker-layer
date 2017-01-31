FROM fedora:25
MAINTAINER Sébastien Wilmet

RUN dnf -y install https://raw.githubusercontent.com/UnitedRPMs/unitedrpms/master/RPM/unitedrpms-25-1.noarch.rpm && \
	rpm --import https://raw.githubusercontent.com/UnitedRPMs/unitedrpms.github.io/master/URPMS-GPG-PUBLICKEY-Fedora-24 && \
	dnf -y upgrade && \
	dnf -y group install "Basic Desktop" && \
	dnf -y group install "C Development Tools and Libraries" && \
	dnf clean all

# This RUN command is more subject to change, so keep it separate from the
# previous RUN command, to benefit from the cache.
RUN dnf -y install git && \
	dnf clean all

# Set default command
CMD ["/usr/bin/bash"]

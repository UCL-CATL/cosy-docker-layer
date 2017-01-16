FROM fedora:24
MAINTAINER Sébastien Wilmet

RUN dnf -y install https://raw.githubusercontent.com/UnitedRPMs/unitedrpms/master/RPM/unitedrpms-24-2.noarch.rpm && \
	rpm --import https://raw.githubusercontent.com/UnitedRPMs/unitedrpms.github.io/master/URPMS-GPG-PUBLICKEY-Fedora-24 && \
	dnf -y upgrade && \
	dnf -y group install "Basic Desktop" && \
	dnf -y group install "C Development Tools and Libraries" && \
	dnf -y install git && \
	dnf clean all

RUN dnf -y install \
		mesa-libEGL \
		mesa-libGL && \
	dnf clean all

# Set default command
CMD ["/usr/bin/bash"]

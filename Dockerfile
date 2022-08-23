FROM debian:11-slim

ARG COTNAINER_TIMEZONE=GMT
ARG USERNAME=nvim
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone


# system packages
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install --no-install-recommends -y \
	apt-transport-https \
	automake \
	bsdmainutils \
	ca-certificates \
	cmake \
	coreutils \
	curl \
	libtool \
	libtool-bin \
	locales \
	doxygen \
	g++ \
	gettext \
	git \
	gnupg \
	make \
	pkg-config \
	sudo \
	tar \
	unzip \
	wget \
	zip

# clone, build and install neovim
RUN git clone https://github.com/neovim/neovim /tmp/neovim
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=RelWithDebInfo && make install && rm -r /tmp/neovim




RUN groupadd --gid $USER_GID $USERNAME \
	&& useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
	&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
	&& chmod 0400 /etc/sudoers.d/$USERNAME


# copy config files
COPY --chown=$USERNAME:$USERNAME .config/ /home/$USERNAME/.config
COPY --chown=$USERNAME:$USERNAME .bashrc /home/$USERNAME/

WORKDIR /home/$USERNAME
USER $USERNAME

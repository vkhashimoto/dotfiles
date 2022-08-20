FROM ubuntu:focal

ARG COTNAINER_TIMEZONE=GMT
ARG USERNAME=testuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN groupadd --gid $USER_GID $USERNAME \
	&& useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
	&& apt-get update \
	&& apt-get install -y sudo \
	&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
	&& chmod 0400 /etc/sudoers.d/$USERNAME

WORKDIR /home/$USERNAME/dotfiles

COPY . .


USER $USERNAME


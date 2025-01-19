# syntax=docker/dockerfile:1.12

FROM debian:11.9

ARG USER=devcontainer
ARG UID=1000
ARG GROUP=devcontainer
ARG GID=1000

RUN set -eux \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
              bash \
              curl \
              rsync \
              make \
              vim \
              zsh
RUN groupadd --gid ${GID} ${GROUP}
RUN useradd ${USER} -m -s /bin/zsh -g ${GID} -u ${UID}

ENV HOME=/home/$USER
ENV SHELL=/usr/bin/zsh
WORKDIR ${HOME}

USER ${USER}:${GROUP}

RUN touch ${HOME}/.zshrc
RUN zsh
RUN mkdir -p "${HOME}/Library/Application Support/Code/User"
COPY . dotfiles

CMD ["zsh"]

# docker run --rm -it dotfiles:0.0.3 /bin/zsh

# Builds a Docker image for Code-Aster in a Desktop environment
# with Ubuntu and LXDE.
#
# The built image can be found at:
#   https://hub.docker.com/r/unifem/codeaster-desktop
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM compdatasci/spyder-desktop
LABEL maintainer "Xiangmin Jiao <xmjiao@gmail.com>"

USER root
WORKDIR /tmp

# Install Code-Aster and petsc
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    	gfortran \
	code-aster-gui \
	code-aster-run && \
    echo "@codeaster-gui" >> $DOCKER_HOME/.config/lxsession/LXDE/autostar && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

########################################################
# Customization for user and location
########################################################

WORKDIR $DOCKER_HOME

USER root

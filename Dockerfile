FROM mbradle/docker_wn_user

ENV NAME VAR
ENV NAME WN_DATA_VERSION
ENV NAME WN_DATA_LEAVE_VERSION_NAME
ENV NAME WN_DATA_FULL

ENV DATA_DIR=/data_directory
ENV BUILD_DIR=${WN_USER_TARGET}/build

RUN git -C ${WN_USER_TARGET} pull

COPY Makefile /data_download/

WORKDIR /data_download/

CMD make $VAR

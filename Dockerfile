FROM mhart/alpine-node:6

RUN apk add --no-cache curl gnupg && \
    gpg  --keyserver ha.pool.sks-keyservers.net --recv-keys 9D41F3C3 && \
    curl -o /tmp/yarn-${VERSION}.tar.gz -sSL https://yarnpkg.com/latest-rc.tar.gz && \
    curl -o /tmp/yarn-${VERSION}.tar.gz.asc -sSL https://yarnpkg.com/latest-rc.tar.gz.asc && \
    gpg --verify "/tmp/yarn-${VERSION}.tar.gz.asc" /tmp/yarn-${VERSION}.tar.gz

WORKDIR "/opt"
RUN tar xzf /tmp/yarn-${VERSION}.tar.gz && \
    mv /opt/dist /opt/yarn && \
    ln -sf /opt/yarn/bin/yarn /bin/yarn && \
    rm -rf /root/.gnupg /tmp/yarn-${VERSION}.tar.gz /tmp/yarn-${VERSION}.tar.gz.asc \
    /opt/yarn/end_to_end_tests && \
    apk del --no-cache curl gnupg
WORKDIR "/"

FROM alpine:latest

LABEL maintainer="github.com/altshiftzero"

EXPOSE 40120
EXPOSE 30120
EXPOSE 30110

RUN apk add --no-cache libgcc libstdc++ curl ca-certificates npm
RUN mkdir /opt/FiveM
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3784-83da5609fa0670b9e2a319bcc59f546b7b17717a/fx.tar.xz | tar xJ -C /opt/FiveM
RUN npm install -g fvm-installer

ENTRYPOINT ["sh", "/opt/FiveM/run.sh"]

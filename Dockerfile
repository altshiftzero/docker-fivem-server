#   Copyright 2021 AltShiftZero
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


FROM alpine:3.15.4

LABEL maintainer="github.com/altshiftzero"

ENV TXADMIN_VERSION="4.12.0" \
    FIVEM_ARTIFACT="5265-dae83f643b2ea1e2488e1a57b3b1d53988a2128d"

EXPOSE 40120
EXPOSE 30120
EXPOSE 30110

RUN apk add --no-cache libgcc libstdc++ curl ca-certificates npm unzip wget
RUN mkdir /opt/FiveM
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_ARTIFACT}/fx.tar.xz | tar xJ -C /opt/FiveM
RUN wget https://github.com/tabarra/txAdmin/releases/download/v${TXADMIN_VERSION}/monitor.zip
RUN unzip -o monitor.zip -d /opt/FiveM/alpine/opt/cfx-server/citizen/system_resources/monitor
RUN npm install -g fvm-installer

ENTRYPOINT ["sh", "/opt/FiveM/run.sh"]

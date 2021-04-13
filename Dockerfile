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

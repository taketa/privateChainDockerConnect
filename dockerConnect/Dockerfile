FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*
ADD . /media
RUN \
  cd /media \
  /geth init genesis.json
EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/geth","--networkid","1234","--bootnodes","enode://08fe3d99d042b936d287facb54ffc1a729c4a2c33bad30f19c851519e15d283e5a293dd2ce6338817e50d9639792da328e730fa90a754e180a0eb7e4e28a4143@192.168.88.62:30303","console"]

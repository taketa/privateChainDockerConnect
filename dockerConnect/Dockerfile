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
  geth init genesis.json
EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/geth","--networkid","1234","--bootnodes","enode://0ca0ae1bcd46863fb26c01b71c4721ed2cadcb3f68405b94670d4add6a9d87bd00e931ebed1d8894a79afb3f52e42997368ad40f62802ad238031c3408ba24f7@172.17.0.2:30303","console"]

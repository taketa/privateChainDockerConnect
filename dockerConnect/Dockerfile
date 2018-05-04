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

ENTRYPOINT ["/geth","--networkid","1234","--bootnodes","enode://911659f75f73e642d9d95ec68185e61bd2dddabf1b8c035096bdf96e256ad46e80a4af1577d73dc1a67c7ecd5ca92c5637e5a26b68a8b8dbc1f774d00e1649db@192.168.88.62:30303","console"]

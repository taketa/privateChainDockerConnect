FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*
ADD . /media
WORKDIR /media
RUN \ 
  cd /media \
  /geth init genesis.json
EXPOSE 8545
EXPOSE 30303

CMD ["/geth","--networkid","1234","rpc","console"]

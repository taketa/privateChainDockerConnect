FROM alpine:3.7

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /geth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*
WORKDIR /media
ADD . . 
RUN /geth init genesis.json
EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/geth","--networkid","1234","--bootnodes","enode://9bae833f6a1bf48b26021de88a20bf67e90ab0d1d51e0915bb35a62168f8c3d0056a7927a780a9c1a43aefff9cfdf55247b4ac4be474886072f0f08aa643941a@192.168.88.62:30303","console"]

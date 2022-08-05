FROM gcc AS sjasmbuild
RUN apt-get update && apt install git
RUN git clone --recursive -j8 https://github.com/z00m128/sjasmplus.git
WORKDIR /sjasmplus
RUN make

FROM ubuntu:latest
RUN apt-get update && apt install make 
COPY --from=sjasmbuild /sjasmplus/sjasmplus /usr/local/bin/sjasmplus
WORKDIR /src

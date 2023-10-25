FROM ubuntu:22.04

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y make git zlib1g-dev libssl-dev gperf cmake clang-14 libc++-dev libc++abi-dev

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git

WORKDIR telegram-bot-api/
RUN rm -rf build && mkdir build

WORKDIR build
ARG CXXFLAGS="-stdlib=libc++" \
    CC=/usr/bin/clang-14 \
    CXX=/usr/bin/clang++-14
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. ..
RUN cmake --build . --target install

WORKDIR ..
ENTRYPOINT ["./bin/telegram-bot-api"]

EXPOSE 8081

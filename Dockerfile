FROM ubuntu:22.04 AS builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    cmake \
    make \
    wget \
    unzip \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget https://www.sqlite.org/2018/sqlite-amalgamation-3260000.zip -O sqlite-src.zip && \
    unzip sqlite-src.zip && \
    rm sqlite-src.zip && \
    mv sqlite-amalgamation-3260000 src

COPY CMakeLists.txt /app/src/

WORKDIR /app/src
RUN mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make VERBOSE=1 && \
    make install DESTDIR=/app/install

FROM ubuntu:22.04 AS runtime

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgcc-s1 \
    libc6 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/install/usr/local/lib/libsqlite3.so /usr/local/lib/
COPY --from=builder /app/install/usr/local/include/sqlite3.h /usr/local/include/
COPY --from=builder /app/install/usr/local/include/sqlite3ext.h /usr/local/include/

RUN ldconfig

WORKDIR /app
CMD ["bash"]
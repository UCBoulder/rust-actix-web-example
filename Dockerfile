FROM rust:1.80 as builder

WORKDIR /usr/src/rust-actix-web
COPY . .
RUN cargo install --path .

FROM debian:bookworm-slim

RUN rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/cargo/bin/rust-actix-web \
    /usr/local/bin/rust-actix-web

CMD ["rust-actix-web"]

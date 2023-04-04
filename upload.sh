#!/bin/bash
cargo clean
git pull --rebase origin main &&  cross build --target armv7-unknown-linux-musleabihf --features vendored_openssl,sqlite --release &&  scp target/armv7-unknown-linux-musleabihf/release/vaultwarden nas:bitwarden/bitwarden_rs.new && cargo clean

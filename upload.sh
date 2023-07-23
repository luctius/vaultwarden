#!/bin/bash
cargo clean 
./update.sh &&  cross build --target armv7-unknown-linux-musleabihf --features vendored_openssl,sqlite --release &&  scp target/armv7-unknown-linux-musleabihf/release/vaultwarden nas:bitwarden/bitwarden_rs.new && cargo clean
echo "download https://github.com/dani-garcia/bw_web_builds/releases/latest"

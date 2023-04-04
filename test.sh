#!/bin/bash
cross build --target armv7-unknown-linux-musleabihf --features vendored_openssl,sqlite --release &&  scp target/armv7-unknown-linux-musleabihf/release/vaultwarden nas:/home/bitwarden/bitwarden_rs.test

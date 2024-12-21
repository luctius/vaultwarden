#!/bin/bash -x
cargo clean
./update.sh
mkdir -p ./target/armv7-unknown-linux-gnueabihf/release/deps/ &&  cp ./deps/* ./target/armv7-unknown-linux-gnueabihf/release/deps/
cargo zigbuild --target armv7-unknown-linux-gnueabihf.2.26 --features vendored_openssl,sqlite --release  || cp ./deps/* ./target/armv7-unknown-linux-gnueabihf/release/build/ring-*/out/
cargo zigbuild --target armv7-unknown-linux-gnueabihf.2.26 --features vendored_openssl,sqlite --release &&  scp target/armv7-unknown-linux-gnueabihf/release/vaultwarden nas:/home/bitwarden/bitwarden_rs.new && cargo clean
#cross build --target armv7-unknown-linux-musleabihf --features vendored_openssl,sqlite --release 
WEB_VAULT_FILE=$(curl -s https://api.github.com/repos/dani-garcia/bw_web_builds/releases/latest | grep "browser_download_url.*\.tar\.gz" | cut -d : -f 2,3 | tr -d \" | head -n 1)
ssh nas "cd bitwarden && rm -rf web-vault.previous ; mv web-vault web-vault.previous ; ./bitwarden_rs.new -v ; echo ${WEB_VAULT_FILE} | wget -qi - && tar -zxf bw_web_v*.tar.gz && rm bw_web_v*.tar.gz"

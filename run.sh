scp -r nas:bitwarden/data/db.sqlite3 data
./target/release/vaultwarden ||  cargo run --features vendored_openssl,sqlite --release

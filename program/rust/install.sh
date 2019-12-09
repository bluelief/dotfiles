#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain nightly
. $HOME/.bash_profile
rustup target add x86_64-unknown-linux-musl
rustc --version

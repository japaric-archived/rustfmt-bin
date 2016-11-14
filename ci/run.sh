set -ex

test_mode() {
    :
}

deploy_mode() {
    if [ $TRAVIS_OS_NAME = osx ]; then
        export CARGO_TARGET_DIR=$(pwd)/target
    fi

    cargo rustc $flags --bin cargo-fmt -- -C lto
    cargo rustc $flags --bin rustfmt -- -C lto
}

run() {
    flags="--manifest-path rustfmt/Cargo.toml --target $TARGET --release"
    if [ -z $TRAVIS_TAG ]; then
        test_mode
    else
        deploy_mode
    fi
}

run

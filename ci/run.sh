set -ex

test_mode() {
    :
}

deploy_mode() {
    if [ $TRAVIS_OS_NAME = osx ]; then
        export CARGO_TARGET_DIR=$(pwd)/target
    fi

    cd rustfmt
    cargo rustc --target $TARGET --release --bin cargo-fmt -- -C lto
    cargo rustc --target $TARGET --release --bin rustfmt -- -C lto
    cd ..
}

run() {
    if [ -z $TRAVIS_TAG ]; then
        test_mode
    else
        deploy_mode
    fi
}

run

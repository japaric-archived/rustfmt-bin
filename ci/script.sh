set -ex

main() {
    pushd rustfmt
    cross rustc --target $TARGET --release --bin cargo-fmt -- -C lto
    cross rustc --target $TARGET --release --bin rustfmt -- -C lto
    popd
}

if [ -z $TRAVIS_TAG ]; then
    main
fi

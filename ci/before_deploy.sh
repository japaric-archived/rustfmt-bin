set -ex

main() {
    local src=$(pwd) \
          stage=

    case $TRAVIS_OS_NAME in
        linux)
            stage=$(mktemp -d)
            ;;
        osx)
            stage=$(mktemp -d -t tmp)
            ;;
    esac

    cross rustc \
          --bin cargo-fmt \
          --manifest-path rustfmt/Cargo.toml \
          --release \
          --target $TARGET \
          -- -C lto
    cross rustc \
          --bin rustfmt \
          --manifest-path rustfmt/Cargo.toml \
          --release \
          --target $TARGET \
          -- -C lto

    cp rustfmt/target/$TARGET/release/cargo-fmt $stage/
    cp rustfmt/target/$TARGET/release/rustfmt $stage/

    cd $stage
    tar czf $src/$CRATE_NAME-$TRAVIS_TAG-$TARGET.tar.gz *
    cd $src

    rm -rf $stage
}

main

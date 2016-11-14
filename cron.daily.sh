#!/bin/sh

set -ex

git pull

( cd rustfmt && git pull )

test -z "$(git status -s)" || (
    git config user.name "Jorge Aparicio"
    git config user.email "japaricious@gmail.com"

    git add rustfmt
    git commit -m "update the rustfmt submodule"

    set +x
    git push https://$(cat ~/.gh_token)@github.com/japaric/rustfmt-bin.git && echo OK
    set -x

    git tag -a v$(grep version rustfmt/Cargo.toml | cut -d'"' -f2)-$(date +"%Y%m%d") -m "deploy"

    set +x
    git push https://$(cat ~/.gh_token)@github.com/japaric/rustfmt-bin.git --tags && echo OK
)

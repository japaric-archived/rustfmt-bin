#!/bin/sh

set -ex

( cd rustfmt && git pull )

git diff-index --quiet HEAD -- || (
    git add rustfmt
    git commit -m "update the rustfmt submodule"
    git push
    git tag -a v$(grep version rustfmt/Cargo.toml | cut -d'"' -f2)-$(date +"%Y%m%d") -m "deploy"
    git push --tags
)

#!/usr/bin/env bash

set -xeuo pipefail

# This is needed to avoid an error with `./mach build`.
sudo apt-get update

# This is needed to avoid an error with `./mach bootstrap` but also it is
# useful to store `git-cinnabar`.
mkdir -p "$MOZBUILD_STATE_PATH"

# Checkout `git-cinnabar`.
git clone https://github.com/glandium/git-cinnabar "$MOZBUILD_STATE_PATH/git-cinnabar"

# Install the `git-cinnabar` helper.
git cinnabar download

# Install some python tools like `git-revise` and `moz-phab`.
pip install --user git-revise MozPhab

# Download and execute Mozilla's bootstrap script.
curl https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py -O
python3 bootstrap.py --vcs=git --no-interactive

# `git-cinnabar` says we should set this configuration flag.
cd "$GITPOD_REPO_ROOT/mozilla-unified" || exit 2
git config fetch.prune true

# Fetch new commits, if any.
git pull

# Build Firefox.
./mach build

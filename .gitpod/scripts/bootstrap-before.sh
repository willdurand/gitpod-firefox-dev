#!/usr/bin/env bash

set -xeuo pipefail

# Try server: if both FIREFOX_TRY_USERNAME and FIREFOX_TRY_SSH_KEY environment
# variables are present, configure the credentials for pushing to try.
#
# NB: when defining the FIREFOX_TRY_SSH_KEY env var variable in Gitpod web UI,
# replace newlines by "\n".
function configure_try_credentials() {
	echo -e "Host hg.mozilla.org\n  User $FIREFOX_TRY_USERNAME" >> ~/.ssh/config
	echo -e "$FIREFOX_TRY_SSH_KEY" > ~/.ssh/id_rsa
	chmod 600 ~/.ssh/id_rsa
}
[[ -n "${FIREFOX_TRY_USERNAME-}" ]] && [[ -n "${FIREFOX_TRY_SSH_KEY-}" ]] && configure_try_credentials

# Store the MozPhab credentials inside the workspace, so that they are restored
# when the workspace is re-opened.
touch /workspace/.arcrc
[[ -n "${FIREFOX_PHABRICATOR_API_TOKEN-}" ]] && echo "{\"hosts\": {\"https://phabricator.services.mozilla.com/api/\": {\"token\": \"${FIREFOX_PHABRICATOR_API_TOKEN}\"}}}" > ~/.arcrc

# Force the exit code here because the previous command could return a non-zero
# exit code when there is no Phabricator token...
exit 0

# gitpod-firefox-dev

This repository contains a proof of concept to develop Firefox using
[Gitpod.io][].

Try now by clicking the button below:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/willdurand/gitpod-firefox-dev)

[gitpod.io]: https://gitpod.io/

## Configuration

When opening a workspace, the standard Mozilla developer utilities are already available (git-cinnabar,
mach, moz-phab, etc.) However, by defining some optional environment variables in your Gitpod account,
you can pre-configure some of this tools.

### Try server credentials

Mozilla's [try server](https://wiki.mozilla.org/ReleaseEngineering/TryServer) allows developers to test
a patch before checking the patch to the core repository.

If you have [access to the try server](https://wiki.mozilla.org/ReleaseEngineering/TryServer#Getting_access_to_the_Try_Server), you can add your try credentials to Gitpod. This will allow `./mach try` to work right out of the box.

For this, define the following environement variables in your Gitpod account:

- **FIREFOX_TRY_USERNAME**: the username of your try server account.
- **FIREFOX_TRY_SSH_KEY**: the private ssh key of your try server account. The key must be formatted
  with '\n' for each newline.

### MozPhab credentials

[Phabricator](https://wiki.mozilla.org/Phabricator#Phabricator_at_Mozilla) is used for Firefox's code reviews.
The `moz-phab` command-line tool comes pre-installed in the workspace, but it needs an API key to work properly.

To configure `moz-phab` with your own credentials, define the following environement variables in your Gitpod account:

- **FIREFOX_PHABRICATOR_API_TOKEN**: your Phabricator API Token, typically retrieved from [https://phabricator.services.mozilla.com/conduit/login/](https://phabricator.services.mozilla.com/conduit/login/).

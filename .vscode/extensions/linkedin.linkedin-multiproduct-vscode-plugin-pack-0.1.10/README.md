# Multiproduct VS Code plugin pack

This extension pack facilitates development of Multiproducts at LinkedIn.

For more suggestions or ideas about VS Code extensions we can build, please email:
li-vscode@linkedin.com

## Features

### Syntax highlighting
For `.acl` files, Config2 `.src` and `.fabric` files

![acl syntax highlight demo](https://media.licdn-ei.com/media/AAYQAwTiAAgAAQAAAAAAAAGHiMZK5u_KQ0myyrmk6fj8sA.jpg)

### product-spec support
JSON schema validation and editing support for `product-spec.json`

![product spec demo](https://media.licdn-ei.com/media/AAYQAwTiAAgAAQAAAAAAAANcvljDTkSkRVym3j3yfqk3Zw.gif)

### Source ACLs view
See the ACL owners of the currently open file

![acl view demo](https://media.licdn-ei.com/media/AAYQAwTiAAgAAQAAAAAAAAPWLl6eUStYRSy4bB4hxDVGgw.jpg)

### Mint commands as tasks
Access Mint build commands from your product-spec as VS Code tasks

![mint commands demo](https://media.licdn-ei.com/media/AAYIAwTiAAgAAQAAAAAAAAQFt4MhBz7cTNW_6T9l17OOiQ.gif)

### Auto update
This extension auto downloads and updates itself as new versions are released.

## Requirements

You'll need VS Code 1.43.0 (March 2020) or newer.

Ensure your VS Code is updated to 1.43.0+ (March 2020 or newer) using Code > Check for Updates. You
might need to restart afterward.

In general, going forward, LinkedIn private extensions will likely not support VS Code versions
older than 6 months. Since VS Code updates tend to get released on a near-monthly cadence, just
accept updates (download, install and restart if necessary) a few times a year.

## Installation

1. Obtain the latest LinkedIn Multiproduct VSIX file (packaged extension):
   1. Go [here](https://artifactory.corp.linkedin.com:8083/artifactory/npm-internal/com/linkedin/multiproduct-vscode-plugin-pack/multiproduct-vscode-plugin-pack/) (Artifactory)
   1. Click into the latest version (shown at bottom)
   1. Download the vsix file
1. Install the VSIX into VS Code ([instructions](https://code.visualstudio.com/docs/editor/extension-gallery#_install-from-a-vsix))

## Configuration

This extension consumes several settings. See VS Code docs for instructions on modifying your
settings.

### Configuring auto update (shared by all LinkedIn private extensions)

It's recommended you specify the auto update settings at user level.

Note that auto update settings will be shared by not only this extension, but also by any other
LinkedIn private extensions.

Example setting:

```json
  "linkedin-extensions.directory": "/Users/rconrad/.vscode-linkedin-extensions",
  "linkedin-extensions.autoUpdate": true,
```

The setting `linkedin-extensions.directory` holds the directory path where LinkedIn private extensions (VSIX files) are stored before they are installed into VS Code. This setting has the default value of `$HOME/.vscode-linkedin-extensions`

VS Code tends to store its own things inside $HOME/.vscode so if you'd like to change this setting, we recommend creating a sibling directory so it might be easier to find later.

The auto update flag `linkedin-extensions.autoUpdate` is recommended and defaults to true. It means
"install updates immediately after downloading them". If true, extension updates (downloaded to the
location you configured in `linkedin-extensions.directory`) will be installed automatically once
downloaded. If you set autoUpdate to false, any available update will still be downloaded to your
directory and you'll be able to manually install it yourself whenever you like (using "Install from
VSIX..." or however you originally installed the extension the first time).

### Configuring "Source ACLs" view

```json
  "multiproduct.enableSourceAclsView": true,
```

This will create a permanent (but collapsible) tree view inside the built-in Explorer view
container. As you edit files, the Source ACLs view updates to reflect owners of the file in the
active (focused) text editor, as indicated by the acl/*.acl files within the MP that contains the
file.

## Activation

To be a good citizen in the VS Code extension ecosystem, this extension does _not_ automatically
activate every time you start up VS Code. Instead, it activates whenever you open a multiproduct
root directory (what a `mint checkout` creates, i.e. the directory with a _product-spec.json_ file).

Activation events are specified in the extension's package.json `activationEvents`.

(In general, extensions are advised to activate only when needed, to the extent possible. For
example, if you're working in an OSS project then LinkedIn multiproduct support is not relevant so
we wouldn't want this extension to consume resources in your VS Code.)

## Updates

This extension checks for updates by querying Artifactory. Update checking happens when the
extension is activated and periodically thereafter (once per day) as long as the extension remains
running in VS Code.

If you're not on the corporate network (VPN or office) when an update check happens, it will just
silently fail. Not to worry - another check will happen the next day.

If a newer version of the extension is found in Artifactory, it will be downloaded automatically and
stored inside `linkedin-extensions.directory`. Then, if you've enabled auto update, the update will
be installed automatically. See [Configuration](#Configuration) for details.

The update checker logs its progress in a "Multiproduct" channel which you can find in the built-in
Output view.

## Limitations

To use this extension you'll need to open VS Code to an MP root directory. We do _not_ support
loading a non-multiproduct-root folder in VS Code. The "Source ACLs" feature relies on figuring out
the MP that owns a given file, using VS Code APIs that are workspace folder aware.

If you want to work with multiple MPs in the same VS Code window, you can use a
[multi-root workspace](https://code.visualstudio.com/docs/editor/multi-root-workspaces) and add MP
root directories one at a time.

## Feedback

Email: li-vscode@linkedin.com

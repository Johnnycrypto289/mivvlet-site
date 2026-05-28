# Mivvlet GitHub Pages Publish

This folder contains only the public static Mivvlet launch site files copied from `27_mivvlet_domain_launch/`.

Target repo: `Johnnycrypto289/mivvlet-site`

Temporary live URL after GitHub Pages activates:

`https://johnnycrypto289.github.io/mivvlet-site/`

Temporary social bio URL:

`https://johnnycrypto289.github.io/mivvlet-site/links.html`

Temporary public contact:

`https://github.com/Johnnycrypto289/mivvlet-site/issues/new?template=contact.yml`

Final production target remains:

`https://mivvlet.com/`

The GitHub Pages copy uses GitHub Pages metadata so previews work before the domain is purchased. The Cloudflare/domain copy in `27_mivvlet_domain_launch/` remains configured for `mivvlet.com`.

The temporary GitHub Pages copy does not use an active `mailto:` link because `hello@mivvlet.com` is not routed yet. Contact uses a GitHub issue form until domain email works.

## Privacy Boundary

This folder must stay public-safe. Do not add passwords, private setup notes, OTPs, payment records, inbox screenshots, recovery details, or claim proof files here.

## Publish Flow

Run `deploy-github-pages.command` from the workspace root. It initializes a standalone Git repo in this folder, creates or updates `Johnnycrypto289/mivvlet-site`, pushes the public files, and enables GitHub Pages from the `main` branch root.

Run `refresh-github-pages-status.command` to update `publish-status.md` with the current repo, Pages, and live URL state.

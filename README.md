# bnc.ee

A Jekyll site. Basic commands:

[![Jekyll build status](https://github.com/GJPub/bnc.ee/actions/workflows/jekyll-build.yml/badge.svg)](https://github.com/GJPub/bnc.ee/actions/workflows/jekyll-build.yml)

Install dependencies:

```bash
bundle install
```

Serve locally:

```bash
bundle exec jekyll serve
```

Notes:

- Plugins used are declared in `Gemfile` and `_config.yml`.
- `jekyll-assets` was removed due to compatibility issues; if you need an asset pipeline, consider `jekyll-asset-pipeline` or upgrading the environment.
- Legacy `.html` URLs are handled:
  - HTML redirect pages are generated (via `jekyll-redirect-from`) to forward browsers to pretty permalinks.
  - For HTTP-level redirects on hosts like Netlify, a `_redirects` file is included in the repo.
- Before deploying, set `url` in `_config.yml` to your production site (e.g., `https://bnc.ee`) so sitemap and robots contain correct URLs.

## PR previews (GitHub Pages)

This repository's CI builds a preview of the generated site for pull
requests and publishes it under the `gh-pages` branch in a path scoped to
the PR number. When a PR is opened, the workflow will post a comment with
the preview URL in the form:

```text
https://<owner>.github.io/<repo>/preview/pr-<number>/
```

How it works

- The `build` job runs `bundle exec jekyll build` and uploads the
  `_site` folder as an artifact when the event is a pull request.
- The `preview` job (runs only on pull requests) downloads the `_site`
  artifact, checks out the `gh-pages` branch, copies the preview into
  `preview/pr-<number>/`, commits and pushes the changes, and posts a
  comment on the PR with the preview URL.

Permissions and branch protection

- The preview job uses `GITHUB_TOKEN` to push to `gh-pages`. If
  `gh-pages` has branch protection rules that block pushes, the job will
  fail to push. You can resolve this by:

  - Allowing GitHub Actions to push to `gh-pages` (in branch protection
    settings), or
  - Using a personal access token stored in `secrets.GH_PAGES_TOKEN`
    with push access to `gh-pages` and updating the workflow to use that
    token.

Enabling GitHub Pages

- Go to the repository *Settings → Pages*. Select the `gh-pages` branch
  as the Pages source (root). GitHub will publish the content at

  `https://<owner>.github.io/<repo>/`.

Cleanup and retention

- Previews are committed into `gh-pages/preview/pr-<number>/`. If you
  want automatic cleanup of old previews, tell me and I can add a
  cleanup step to the workflow (for example: remove previews older than
  N days).


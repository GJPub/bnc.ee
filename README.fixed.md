# bnc.ee

A Jekyll site. Basic commands:

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

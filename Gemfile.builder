source "https://rubygems.org"

# Specify the Jekyll version
gem "jekyll", "~> 3.9.5"

# Plugins from your _config.yml
gem "jekyll-remote-theme"

# Core Jekyll plugins
gem "jekyll-seo-tag"
gem "jekyll-feed"
gem "jekyll-sitemap"
gem "kramdown-parser-gfm"
gem "webrick", "~> 1.7"

group :jekyll_plugins do
  gem "jekyll-paginate"
end
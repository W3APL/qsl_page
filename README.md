# W3APL Club Website

Source for the JHU Applied Physics Lab Amateur Radio Club (W3APL) website,
published at <https://www.qsl.net/w3apl/>. It's a [Jekyll](https://jekyllrb.com)
site using the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/)
theme, installed as a gem.

## Adding a post

Create a Markdown file in the matching folder under `_posts/`, named
`YYYY-MM-DD-short-title.md`:

- `_posts/monthly_net/` for Monthly Net News and Net Reports
- `_posts/weekend_update/` for the Weekend Update

Start the file with front matter like this:

```yaml
---
title: "Monthly Net News November 5th, 2026"
date: 2026-11-05 17:30:00 -0500
categories: news
tags: net
classes: wide
---
```

The `date` (not the filename) sets the post's URL, so keep the two in agreement.
Use `-0400` for dates during daylight saving time and `-0500` otherwise. The
layout, author sidebar, share buttons, and related posts come from defaults in
`_config.yml`, so you don't need to set them per post.

Images go in `assets/images/`. Please resize photos to 1600 px wide or less
before adding them, since full-size camera files slow the site down a lot.
Reference them with `relative_url` so the `/w3apl` prefix is added for you:

```markdown
![Description of the photo]({{ '/assets/images/my-photo.jpg' | relative_url }})
```

## Setting up your computer to build the site

You only need to do this once per computer. It takes about 15 to 30 minutes,
most of which is waiting for Ruby to compile.

### 1. Install the basic tools

#### macOS

Install the Xcode command line tools and [Homebrew](https://brew.sh),
then the Ruby version manager and the libraries Ruby needs:

```sh
xcode-select --install
brew install git rbenv ruby-build libyaml
```

Then add rbenv to your shell and open a new terminal window:

```sh
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
```

#### Linux (Debian/Ubuntu)

```sh
sudo apt install git build-essential libssl-dev libyaml-dev zlib1g-dev libffi-dev rbenv
```

then follow the "Basic Git Checkout" steps at <https://github.com/rbenv/rbenv>
if your distribution's rbenv is too old to know about the Ruby version we use.

#### Windows

Use [WSL](https://learn.microsoft.com/windows/wsl/install) and
follow the Linux steps inside it. Native Windows Ruby works for many Jekyll
sites, but WSL matches the build server much more closely.

### 2. Get the code

```sh
git clone https://github.com/<org-or-user>/w3apl_qsl.git
cd w3apl_qsl
```

### 3. Install Ruby

The site's Ruby version is listed in `.ruby-version`. From inside the project
folder, rbenv reads that file and installs the matching version:

```sh
rbenv install
ruby -v          # should match the version in .ruby-version
```

If `rbenv install` says it doesn't know that version, update its list of
Ruby releases (`brew upgrade ruby-build` on macOS) and try again.

### 4. Install Bundler and the site's gems

Bundler installs the exact versions of Jekyll, the theme, and plugins listed
in `Gemfile.lock`. Install the Bundler version the lockfile expects, keep the
gems inside the project folder, then install:

```sh
gem install bundler -v "$(tail -1 Gemfile.lock | tr -d ' ')"
bundle config set --local path vendor/bundle
make install
```

### 5. Build and preview

```sh
make serve
```

Open <http://127.0.0.1:4000/w3apl/> in a browser. The site rebuilds whenever
you save a file; refresh the page to see changes. Press Ctrl+C to stop.
Posts in a `_drafts/` folder (no date in the filename) appear in the preview
but are never published.

To check that the site builds cleanly without starting a server, run
`make build`. Changes to `_config.yml` need a restart of `make serve`.

### Troubleshooting

- **Use `make install` (`bundle install`), not `bundle update`.** `bundle update`
  upgrades every gem, including the theme, and rewrites `Gemfile.lock`. Only do
  that on purpose, in its own commit, and check `_includes/footer.html`
  afterward.
- **`cannot load such file ... bundler-X.Y.Z/exe/bundle`:** your Bundler
  install is damaged. Rerun the `gem install bundler` line from step 4. If it
  says Bundler is already installed, run `gem pristine bundler -v X.Y.Z`
  (using the version from the error).
- **`ruby -v` shows the wrong version:** rbenv isn't active in your shell.
  Make sure you opened a new terminal after step 1, and run `rbenv init` for
  instructions specific to your shell.
- **"Address already in use" from `make serve`:** another preview is still
  running. Stop it, or run
  `bundle exec jekyll serve --drafts --port 4001`.

## Deploying

Pushing to `main` runs the GitHub Action in `.github/workflows/deploy.yml`,
which builds the site and mirrors `_site/` to qsl.net over FTP. The workflow
can also be run by hand from the Actions tab; manual runs default to a dry run
that only reports what would change.

## Theme overrides

Theme files come from the `minimal-mistakes-jekyll` gem. Only these are
overridden locally:

- `_includes/head/custom.html` adds the favicons
- `_includes/footer.html` adds the qsl.net thank-you (see the comment at its top)

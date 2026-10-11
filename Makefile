# Define variables
JEKYLL_BUILD_COMMAND = bundle exec jekyll build
JEKYLL_SERVE_COMMAND = bundle exec jekyll serve --drafts --watch

.PHONY: help build serve clean install help

.DEFAULT_GOAL = help

build: ## Build the Jekyll site
	$(JEKYLL_BUILD_COMMAND)

serve: ## Serve the Jekyll site locally with drafts and watch for changes
	$(JEKYLL_SERVE_COMMAND)

clean: ## Clean the _site directory
	rm -rf _site

install: ## Install Jekyll dependencies (if using Bundler)
	bundle install

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
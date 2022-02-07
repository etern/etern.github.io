---
layout: post
title:  Setup github pages
date:   2022-02-07 21:12:55 +0800
---

# Install jekyll
1. `apt install ruby ruby-dev`
2. `gem install jekyll bundler`

# Create site
1. `mkdir mysite`
2. `jekyll new --skip-bundle .`
3. edit Gemfile, comment out `gem "jekyll"`, uncomment `gem "github-pages"`

# Update dependency
1. `rm Gemfile.lock`
2. `bundle update`

# Run locally
`bundle exec jekyll serve -P 8080`

# Create post
1. `cd _post`
2. ``emacs `date -I`-post-name.md``
3. `M-x` `auto-insert`

	where front matter template is defined as:
   ```lisp
   (define-auto-insert (rx (seq (= 4 digit) ?- (= 2 digit) ?- (= 2 digit) (one-or-more any) ".md"))
     (lambda ()
       (insert "---\nlayout: post\ntitle: ")
       (insert (substring (file-name-base (buffer-name)) 11))
       (insert "\ndate: ")
       (insert (format-time-string "%Y-%m-%d %H:%M:%S %z\n---"))))
   ```

# Reference
- [Set up site with jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll)

---
title: I wrote this blog post in markdown without writing markdown
date: 2022-02-11 23:08:00 +0800
---
Actually, I wrote Org.

Github pages is awesome, with the default supported `jekyll`, you can't
write in org-mode, some people resort to alternative site generators,
like `hugo`, for a workaround, and here is another way:
[edit-as-format](https://github.com/etern/edit-as-format).

# How to use the package

With this package, you can edit one format as another format, in **emacs**,
as long as both format supported by pandoc, like `org` \<-\> `markdown`.

Here's the steps:

1.  Create this blog post as markdown, open it in emacs. (the parent
    buffer)

2.  `M-x` `edit-as-format-org` will open an org-mode buffer. (the
    indirect buffer)

3.  Write in this buffer with Org syntax, `C-x C-s` to commit back to
    parent buffer.

# Why should you use it

What really matters about blogging format, the **syntax** or **storage
format**? Here is my view:

| Factor             | Really Matters? |
| ------------------ | --------------- |
| Syntax             | Yes             |
| Writing Experience | Yes             |
| Storage file       | No              |

  - I like Org over markdown, because of the syntax, I like to write
    slash(/) for *italic*, which is more intuitive than star(\*)
  - I like Org inside **Emacs**, it feels soooo good editing Org tables
    with `TAB` key
  - How is the file stored, `*.md` file or `*.org` file? pure text? or
    even binary? Not important, only if it can be edited in emacs with
    Org syntax

If you agree with me, the `hugo` solution seems less attractive, you
should try `edit-as-format` ;)

Org mode is such big thing, pandoc might not support all of it's
features, I just show you the most basic ones: emphasis, links,
ordered/unordered list and tables, that's great amount for blog posting.

The last point, if you don't agree that Org is better than markdown,
`edit-as-format` is for you, you can edit Org files as markdown\!

# github-pages-trailing-slash

How GitHub Pages resolves URLs with and without a trailing slash for two static output layouts.

- `site/flat/` uses the layout that [Void](https://void.cloud)'s `output: 'static'` writes today: every page except the index is `<path>.html`, so a section page sits next to a directory of the same name.
- `site/directory/` uses directory indexes: every page is `<path>/index.html`.

```
site/flat/index.html              site/directory/index.html
site/flat/about.html              site/directory/about/index.html
site/flat/posts.html              site/directory/posts/index.html
site/flat/posts/hello.html        site/directory/posts/hello/index.html
```

The site is deployed with GitHub Actions (`upload-pages-artifact` and `deploy-pages`), with no build step, at https://honb.in/github-pages-trailing-slash/ (the account's Pages custom domain).

## Results

Checked on 2026-10-29 with `./check.sh`, which prints the status and redirect target of each URL. Redirects go to the same path with a trailing slash added.

| Page | `flat/` | `flat/` with `/` | `directory/` | `directory/` with `/` |
|---|---|---|---|---|
| `about` | 200 | 404 | 301 | 200 |
| `posts` | 200 | 404 | 301 | 200 |
| `posts/hello` | 200 | 404 | 301 | 200 |

- With the flat layout, every trailing-slash URL returns 404, including `/flat/posts/`, where `posts.html` sits next to a `posts/` directory that has no `index.html`.
- With directory indexes, both forms work: the URL without a slash redirects to the one with it.

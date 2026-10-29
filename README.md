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

The site is deployed with GitHub Actions (`upload-pages-artifact` and `deploy-pages`), with no build step.

## Results

Run `./check.sh` to print the status and redirect target of each URL.

Results are added here after the first deploy.

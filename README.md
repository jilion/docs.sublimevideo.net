# [SublimeVideo's Documentation app](http://docs.sublimevideo.net) [![Build Status](https://semaphoreapp.com/api/v1/projects/c1c344b459414715c1bab121fc84b6cb2e2aea07/20911/badge.png)](https://semaphoreapp.com/projects/1312/branches/20911)

This app is using the [SublimeVideo layout gem](https://github.com/jilion/sublime_video_layout) and [Houndsleuth](http://www.houndsleuth.com) (Freebie plan) for the full-text search.

## Installation

Copy `.gitconfig` content to `.git/config`.

```bash
bundle install
```

## Development

Link the app in Pow:

```bash
powder link && mv ~/.pow/docs.sublimevideo.net ~/.pow/docs.sublimevideo
```

Visit the app:

``` bash
open http://docs.sublimevideo.dev
```

## Deployment

If you've modified a page's content, run the following command, it will deploy and rebuild the full-text search index:

``` bash
rake deploy:production
```

Without rebuilding the full-text search index:

``` bash
git push production
```

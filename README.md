## weigery
[![Circle CI](https://circleci.com/gh/taniyu/weigery.svg?style=shield)](https://circleci.com/gh/taniyu/weigery)
[![Code Climate](https://codeclimate.com/github/taniyu/weigery/badges/gpa.svg)](https://codeclimate.com/github/taniyu/weigery)

## deploy

デプロイサーバのrailsアカウントに対してデプロイを行います．

```
ssh weigery
```
で，rails@weigeryに接続されるように~/.ssh/configを設定してください．
事前に公開鍵の登録が必要となります．

```
bundle exec cap production deploy
```
で対象サーバに対してデプロイが始まります．

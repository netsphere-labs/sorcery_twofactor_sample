# Sorceryで二段階認証 2FA を実装したサンプルコード

 - Ruby 3.1
 - Ruby on Rails 7
 - Sorcery
 - google-authenticator-rails, ~> 2.0

解説 https://www.nslabs.jp/digital-identity.rhtml



## 実装メモ

### 依存関係

 1. `google-authenticator-rails` パッケージは `rotp = 3.3.0` に依存しており、このヴァージョンが内部で `URI.encode()` を呼び出しているため、Ruby 3.0 で動かない。新しい `rotp` パッケージは修正済だが、どうしたものか.

`specifications/google-authenticator-rails-2.0.0.gemspec` ファイルを編集し、修正済である rotp v4.0.2 に依存するようにする。

 2. 更新されていない `google-qr` パッケージ (最終が 2012年) も同様。こういうのは困るね。`URI.encode()` を定義してやるしかない。


### Rails 7 (importmap-rails) + Bootstrap 5 JavaScript not working

`importmap-rails` を使う場合, `<body>` 内に `<script src="/bootstrap5/js/bootstrap.bundle.min.js">` タグを書いても, 画面遷移後に JavaScript が正常に動かない. 一見動いてるように見えるのが混乱する。

```
  $ bin/importmap pin bootstrap
```
`config/importmap.rb` ファイルに次が追加される.

```ruby
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"
```

`app/javascript/application.js` ファイルに `import` 文を追加.

```ruby
import * as bootstrap from "bootstrap"
```




## 先行事例

ちょっとした解説を書いたブログ  
https://yu1056y.hatenablog.com/entry/2019/04/21/164540

その元ネタ. Rails v4.2, google-authenticator-rails v1.2.
https://moneyforward.com/engineers_blog/2015/08/06/google-authenticator-rails/

マネーフォワードエンジニアブログのほうはよいが、それを元にしたゆいな (id:yu1056y) 氏のソースコードは、控えめに言って問題が多く、作り直した。




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Sorceryで二段階認証 2FA を実装したサンプルコード

ちょっとした解説を書いたブログ  
https://yu1056y.hatenablog.com/entry/2019/04/21/164540

その元ネタ. Rails v4.2, google-authenticator-rails v1.2.
https://moneyforward.com/engineers_blog/2015/08/06/google-authenticator-rails/

マネーフォワードエンジニアブログのほうはよいが、それを元にしたゆいな (id:yu1056y) 氏のソースコードは、控えめに言って問題が多く、作り直した。




## 依存関係

 1. `google-authenticator-rails` パッケージは `rotp = 3.3.0` に依存しており、このヴァージョンが内部で `URI.encode()` を呼び出しているため、Ruby 3.0 で動かない。新しい `rotp` パッケージは修正済だが、どうしたものか.

`specifications/google-authenticator-rails-2.0.0.gemspec` ファイルを編集し、修正済である rotp v4.0.2 に依存するようにする。

 2. 更新されていない `google-qr` パッケージ (最終が 2012年) も同様。こういうのは困るね。`URI.encode()` を定義してやるしかない。



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

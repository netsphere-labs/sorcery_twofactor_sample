
# ユーザ
class User < ApplicationRecord
  # Sorcery core モジュール
  # この呼び出しにより, サブモジュールの include や, init_orm_hooks! など.
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 },
                       if: -> { new_record? || changes[:crypted_password] }
  # ActiveRecord の機能。フィールド名は対象のフィールド名に _confirmation を加
  # えたものになる。
  validates :password, confirmation: true,
                       if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true,
                       if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence:true

  # lookup_token: カラム名. デフォルトは `persistence_token`. クッキーに保存す
  #               るときのキー.
  # drift: 許容する秒数
  # issuer: Google 認証システムの画面に表示される.
  acts_as_google_authenticated drift: 30, issuer: 'test_twofactor_auth'
  after_create { |record|
    # GoogleAuthenticatorRails::generate_secret の値が設定される. ユーザごと.
    record.set_google_secret
    # persistence_token はここで設定する必要ない
    #record.persistence_token = SecureRandom.hex unless record.persistence_token
  }
end

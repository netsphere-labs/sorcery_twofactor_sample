# -*- coding:utf-8 -*-
# frozen_string_literal: true

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

  acts_as_google_authenticated lookup_token: :persistence_token, drift: 30, issuer: 'test_twofactor_auth'
  
  before_create { |record|
    record.persistence_token = SecureRandom.hex unless record.persistence_token
  }
  after_create { |record|
    record.set_google_secret
  }
end

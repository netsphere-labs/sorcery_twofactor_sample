# -*- coding:utf-8 -*-
# frozen_string_literal: true

# 自動生成されたモデル
class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # フィールド名は config の email_attribute_name で変更可.
      # デフォルト 'email'
      t.string :email, null: false
      # フィールド名は config の crypted_password_attribute_name で変更可.
      # デフォルト 'crypted_password'
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end

# -*- coding:utf-8 -*-
# frozen_string_literal: true

class AddTwofactorAuthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :persistence_token, :string
    add_column :users, :google_secret, :string
    # 不要.
    #add_column :users, :first_twofactor_logged_in, :boolean
  end
end

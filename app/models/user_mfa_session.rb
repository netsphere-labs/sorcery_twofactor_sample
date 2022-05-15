# -*- coding:utf-8 -*-
# frozen_string_literal: true

# データベースに保存されない. -> クッキーに保存される
class UserMfaSession < GoogleAuthenticatorRails::Session::Base
end


class WelcomeController < ApplicationController
  skip_before_action :require_login

  # GET /
  def index
  end
end

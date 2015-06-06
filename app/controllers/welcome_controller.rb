class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def articles
  end

  def orders
  end
end

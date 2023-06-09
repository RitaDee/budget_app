class HomesController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to categories_path
  end
end

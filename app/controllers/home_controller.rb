class HomeController < ApplicationController
  def index
    if current_user
      redirect_to images_path
    end
  end
end

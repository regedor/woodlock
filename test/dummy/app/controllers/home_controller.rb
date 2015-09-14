class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @photo_url = current_user.facebook_photo_url || current_user.google_photo_url || current_user.gravatar_url
  end
end

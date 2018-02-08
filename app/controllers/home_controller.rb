class HomeController < ApplicationController
  def index
    if org_signed_in?
      redirect_to manage_url
    end
  end
end

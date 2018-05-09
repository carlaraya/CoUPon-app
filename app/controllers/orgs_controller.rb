class OrgsController < ApplicationController
  before_action :set_org, only: [:show]

  def show
  end

private
  def set_org
    @org = Org.friendly.find(params[:name])
    if not @org
      redirect_to root_path
    end
  end
end

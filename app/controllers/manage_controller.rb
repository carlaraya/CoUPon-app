class ManageController < ApplicationController
  before_action :authenticate_org!, only: [:index]
  def index
  end
end

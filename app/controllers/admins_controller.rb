class AdminsController < ApplicationController
  def index
    @org = Org.new
  end
  def create_org
    @org = Org.new(org_params)
    respond_to do |format|
      if @org.save
        format.html { redirect_to admins_path, notice: 'Org was successfully created.' }
        format.json { render :index, status: :ok, location: @org }
      else
        format.html { render :index }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def org_params
      params.require(:org).permit(:name, :email, :password, :password_confirmation)
    end
end

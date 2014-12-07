class GadgetsController < ApplicationController

  def index
    @user = User.find params[:user_id]
    @gadgets = @user.gadgets.all
  end

  def show
    user = User.find params[:user_id]
    @gadget = user.gadgets.find params[:id]
  end

  def new
    @gadget = Gadget.new
  end

  def create
    user = User.find params[:user_id]
    @gadget = user.gadgets.create(gadget_params)
    redirect_to user_gadget_path(user, @gadget)
  end

  def search
    @gadgets = current_user.gadgets.where('name LIKE :name', name: "%" + params[:search] + "%")
  end

  private
    def gadget_params
      params.require(:gadget).permit :name, :image
    end

end
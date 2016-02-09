class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_new_comment
    @user = User.find(params[:id])
    comment = @user.comments.create
    comment.comment = params[:comment]
    comment.user_id = current_user.id
    comment.save
    redirect_to :action => :show, :id => @user
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    begin
      @user = User.find(params[:id])
      @products = Product.where(user_id: @user)
    rescue
      flash[:error] = "This user doesn't exist"
      redirect_to "/users"
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:last_name, :first_name, :address, :role, :email)
  end
end

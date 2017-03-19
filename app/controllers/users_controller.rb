class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user
      @users = User.all
    else
      redirect_to root_url, flash: {danger: "You do not have permission"}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, flash: { success: "User was successfully created."}
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.id == @user.id
      if @user.update(user_params)
        redirect_to @user, flash: { success: 'User was successfully updated.' }
      else
        render :edit
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user.id == @user.id
      @user.destroy
      redirect_to users_url, flash: { success: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end

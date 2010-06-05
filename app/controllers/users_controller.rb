class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  skip_before_filter :redirect_if_no_users, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user_session = UserSession.new(@user)
      @user_session.save

      flash[:notice] = "Account registered, you are now logged in!"
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
  def redirect_if_users
    if has_users?
      flash[:error] = 'There is already an admin account registered.'
      redirect_to new_user_session_path
    end
  end
end

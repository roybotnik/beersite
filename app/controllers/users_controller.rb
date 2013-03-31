class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_info, :only => [:show, :cellar]

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    

  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def cellar
    @title = "Cellar"
    @user = User.find(params[:id])
    beer_groups = @user.beers.group_by(&:id)
    @beer_counts = beer_groups.map {|beer_id,beers| [beers.first, beers.size]}
    render 'show_cellar'
  end

protected
  def user_info
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build if signed_in?
    @following = @user.followed_users.paginate(page: params[:page])
    @followers = @user.followers.paginate(page: params[:page])
  end


end
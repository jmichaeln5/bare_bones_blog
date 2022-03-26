class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @posts = Post.all.order(updated_at: :desc)
  end

end

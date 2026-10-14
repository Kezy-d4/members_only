class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  private

  def post_params
    params.expect(post: [ :title, :body ])
  end
end

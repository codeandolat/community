class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.last_created
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to authenticated_root_path, notice: 'Question was successfully created.'
    else
      render partial: 'shared/error_messages', locals: {resource: @post}, status: :bad_request
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to authenticated_root_path, notice: 'Question was successfully updated.'
    else
      render partial: 'shared/error_messages', locals: {resource: @post}, status: :bad_request
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to authenticated_root_path, notice: 'Question was successfully destroyed.'
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = current_user.posts.friendly.find(params[:id])
    end
end

class CommentsController < ApplicationController
  # This is a callback (also called a before hook)
  # It will run the specified method "set_comment" before executing
  # any of the RESTful actions listed
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # This action shows all comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # This action shows a single comment based on id
  def show
  end

  # GET /comments/new
  # This action renders the "new" form to create a new comment
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {}).permit(:user_name, :body)
    end
end

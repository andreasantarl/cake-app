class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  # def new
  #   @comment = Comment.new
  #   @user = current_user
  #   @cake = Cake.find_by_id(comment_params[:cake_id])
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    @cake = Cake.find_by_id(comment_params[:cake_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @cake }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :cake_id)
    end
end

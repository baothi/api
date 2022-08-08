class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[ show update destroy ]
  skip_before_action :authorize!, only: [:index]
  before_action :load_article

  # GET /comments
  def index
    comments = @article.comments.page(params.dig(:page, :number) || params[:page]).per(params.dig(:page, :size) || params[:per_page])

    render json: @comments
  end

  # GET /comments/1
  # def show
  #   render json: @comment
  # end

  # POST /comments
  def create
    @comment = @article.comments.build(comment_params.merge(user: current_user))

    @comment.save!
    render json: @comment, status: :created, location: @article
  rescue
    render json: @comment, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  # PATCH/PUT /comments/1
  # def update
  #   if @comment.update(comment_params)
  #     render json: @comment
  #   else
  #     render json: @comment.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /comments/1
  # def destroy
  #   @comment.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    def load_article
      @article = Article.find(params[:article_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      # params.require(:comment).permit(:content, :article_id, :user_id)
      params.require(:data).require(:attributes).
      permit(:content) ||
      ActionController::Parameters.new
    end
end

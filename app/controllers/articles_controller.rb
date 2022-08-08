class ArticlesController < ApplicationController
  # include Paginable
  skip_before_action :authorize!, only: [:index, :show]
  # def index
  #   articles = Article.recent
  #   paginated = paginator.call(
  #     articles,
  #     params: pagination_params,
  #     base_url: request.url
  #   )
  #   options = {meta: paginated.meta.to_h, links: paginated.links.to_h}
  #   render json: serializer.new(paginated.items, options), status: :ok
  # end

  def index
    articles = Article.recent.
      page(params[:page]).
      per(params[:per_page])
    render json: articles
  end

  def show
    # article = Article.find(params[:id])
    # render json: serializer.new(article)
    render json: Article.find(params[:id])
  end

  def serializer
    ArticleSerializer
  end

  def create
    article = current_user.articles.build(article_params)
    # article = Article.new(article_params)
    # if article.valid?
    #   #we will figure that out
    # else
    #   render json: article, adapter: :json_api,
    #     serializer: ActiveModel::Serializer::ErrorSerializer,
    #     status: :unprocessable_entity
    # end
    article.save!
    render json: article, status: :created
  rescue
    render json: article, adapter: :json_api,
      # serializer: ActiveModel::Serializer::ErrorSerializer,
      # status: :unprocessable_entity
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  def update
    # article = Article.find(params[:id])
    article = current_user.articles.find(params[:id])
    article.update!(article_params)
    render json: article, status: :ok
  rescue ActiveRecord::RecordNotFound
    authorization_error
  rescue
    render json: article, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy
    head :no_content
  rescue
    authorization_error
  end

  private

  def article_params
    # ActionController::Parameters.new
    params.require(:data).require(:attributes).permit(:title, :content, :slug) || ActionController::Parameters.new
  end


end

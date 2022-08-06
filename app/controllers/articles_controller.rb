class ArticlesController < ApplicationController
  include Paginable
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
    article = Article.find(params[:id])
    render json: serializer.new(article)
  end

  def serializer
    ArticleSerializer
  end


end

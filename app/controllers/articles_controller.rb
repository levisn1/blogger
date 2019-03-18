class ArticlesController < ApplicationController
  include ArticlesHelper

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # def create
  #   @article = Article.new
  #   @article.title = params[:article][:title]
  #   @article.body = params[:article][:body]
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  # def create
  #   @article = Article.new(
  #     title: params[:article][:title],
  #     body: params[:article][:body])
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  # def create
  #   @article = Article.new(params[:article])
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "The article '#{@article.title}' has been created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "The article '#{@article.title}' has been destroyed!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

end

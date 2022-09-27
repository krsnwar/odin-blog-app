require 'pry'

class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @varku = "blahblahblah"
    puts "di show = #{@varku}"
  end

  def new
    @article = Article.new(title: "Hello", body:"booo")
    puts "article new object id #{@article.object_id}"
    @apaan_sih = "Boo"
  end

  def create
    puts "article new object id before assign #{@article.object_id}"
    puts "articles new object id before assign #{@articles.object_id}"
    puts "apaan sih ini #{@apaan_sih.object_id}"
    puts "yang ini belom di define #{@booo.object_id}"

    @article = Article.new(article_params)
    puts "article new object id pertama #{@article.object_id}"


    @article = Article.new(article_params)
    puts "article new object id kedua #{@article.object_id}"


    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    puts "varku object id = #{@varku.object_id}"
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(Params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end

class ArticlesController < ApplicationController
    def show
        @articles=Article.find(params[:id])
    end

    def index 
        @articles=Article.all
    end

    def new
        @article=Article.new
    end

    def create
        @article=Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice]= "article was created"
            redirect_to @article
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        @article=Article.find(params[:id])

        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice]= "article was created"
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end


    end


    

    def edit

        @article=Article.find(params[:id])

    

    end



end

class Api::V1::ArticlesController < ApplicationController
  	def index
		
  		articles=Article.order('created_at DESC');
    	render json: {status: 'SUCCESS', message: 'Loaded articles successfully', data: articles}, status: :ok
  	end

  	def show
		
        article=Article.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded article '  + params[:id]+ 'successfully', data: article}, status: :ok
	end


  	def create
  		
  		article=Article.new(article_params)
        if article.save
            render json: {status: 'SUCCESS', message: 'article created successfully', data: article}, status: :ok
        else
            render json: {status: 'UNSUCCESS', message: 'error',data: article.errors}, status: :unprocessable_entity
        end

  	end

  	def destroy
  		article=Article.find(params[:id])
    	article.destroy
    	render json: {status: 'SUCCESS', message: 'eliminado', data: article}, status: :ok
  	end

  	def update
  		article=Article.find(params[:id])
        if article.update_attributes(article_params)
        	render json: {status: 'SUCCESS', message: 'article updated successfully', data: article}, status: :ok
        else
        	render json: {status: 'UNSUCCESS', message: 'error',data: article.errors}, status: :unprocessable_entity
        end
 	end

  	private 
    def article_params
        params.permit(:title, :body)
    end


end

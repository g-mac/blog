module Api
  module V1
    class ArticlesController < ApplicationController

      acts_as_token_authentication_handler_for User, except: [:index, :show]

      respond_to :json

      def index
        # respond_with Article.all
        # use RABL instead (episode 322)
        @articles = Article.all
      end

      def show
        # respond_with Article.find(params[:id])
        @article = Article.find(params[:id])
      end

      def create
        respond_with Article.create(params[:article])
      end

      def update
        respond_with Article.update(params[:id], params[:article])
      end

      def destroy
        respond_with Article.destroy(params[:id])
      end
    end
  end
end
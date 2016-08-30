module Api
  module V1
    class CommentsController < ApplicationController

      # before_action :authenticate_user!, except: [:index, :show]
      # acts_as_token_authentication_handler_for User, except: [:index, :show] # todo reactivate

      respond_to :json

      def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        # redirect_to article_path(@article)
      end

      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        # redirect_to article_path(@article)
      end

      private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

    end
  end
end

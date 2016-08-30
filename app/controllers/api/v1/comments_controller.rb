module Api
  module V1
    class CommentsController < ApplicationController

      skip_before_action :verify_authenticity_token
      # skip_before_action :verify_authenticity_token, :only => [:create] #need to fix this security hole

      # before_action :authenticate_user!, except: [:index, :show]
      # acts_as_token_authentication_handler_for User, except: [:index, :show] # todo reactivate

      respond_to :json

      def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        # head :ok
        render :json => @article
      end

      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
      end

      private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

    end
  end
end

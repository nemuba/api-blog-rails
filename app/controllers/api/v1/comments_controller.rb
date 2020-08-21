module Api
  module V1
    class CommentsController < ApiController
      before_action :authenticate_user
      before_action :set_comment, only: [:destroy]
      before_action :set_post, only: [:create, :destroy]
    
      # POST /comments
      def create
        @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))
    
        if @comment.save
          render json: @post, include:['user','likes','comments','comments.user','categories'], status: :created
        else
          render json: @comment.errors.full_messages
        end
      end
    
      # DELETE /comments/1
      def destroy
        if @comment.destroy
          render json: @post, include:['user','likes','comments','comments.user','categories'], status: :accepted
        else
          render json: @comment.errors.full_messages
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_comment
          @comment = Comment.find(params[:id])
        end

        def set_post
          @post = Post.find(params[:post_id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def comment_params
          params.require(:comment).permit(:description, :user_id, :post_id)
        end
    end
  end
end
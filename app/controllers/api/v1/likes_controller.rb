module Api
  module V1
    class LikesController < ApiController
      before_action :authenticate_user
      before_action :set_like, only: [:destroy]
      before_action :set_post, only: [:create, :destroy]
    
      # POST /likes
      def create
        @like = @post.likes.new(user_id: current_user.id)
    
        if @like.save
          render json: @post, include:['user','likes','comments','comments.user','categories'], status: :created
        else
          render json: @like.errors, status: :unprocessable_entity
        end
      end
    
    
      # DELETE /likes/1
      def destroy
        if @like.destroy
          render json: @post, include:['user','likes','comments','comments.user','categories']
        else
          render json: @likes.errors
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_like
          @like = Like.find_by(user_id: current_user.id, post_id: params[:id])
        end
    
        def set_post
          @post = Post.find(params[:id])
        end
        
    end
    
  end
end
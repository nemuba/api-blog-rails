module Api
  module V1
    class PostsController < ApiController
      before_action :authenticate_user,except: [:index, :show]
      before_action :set_post, only: [:show, :update, :destroy]
      before_action :set_user, only: [:create, :update]
    
      # GET /posts
      def index
        @posts = Post.all
    
        render json: @posts, root: 'posts', adapter: :json
      end
    
      # GET /posts/1
      def show
        render json: @post
      end
    
      # POST /posts
      def create
        @post = @user.posts.new(post_params)
    
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params.merge(user_id: @user.id))
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /posts/1
      def destroy
        @post.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          @post = Post.find(params[:id])
        end

        def set_user
          @user = current_user
          @user
        end
        # Only allow a trusted parameter "white list" through.
        def post_params
          params.require(:post).permit(:title, :body, :user_id)
        end
    end
  end
end
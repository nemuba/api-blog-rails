module Api
  module V1
    class PostsController < ApiController
      before_action :authenticate_user,except: [:index, :show]
      before_action :set_post, only: [:show, :update, :destroy]
      before_action :set_user, only: [:create, :update]
    
      # GET /posts
      def index
        authenticate_user if current_user
        @posts = Post.includes(:likes, :comments, :categories).order('created_at DESC')
    
        render json: @posts, root: 'posts', include:['user','likes','comments','comments.user','categories'], adapter: :json
      end
    
      # GET /posts/1
      def show
        render json: @post, include:['user','likes','comments','comments.user','categories']
      end
    
      # POST /posts
      def create
        @post = @user.posts.new(post_params)
    
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors.full_messages
        end
      end
    
      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params.merge(user_id: @user.id))
          render json: @post
        else
          render json: @post.errors.full_messages
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
          params.require(:post).permit(:title, :body, :category_ids=>[])
        end
    end
  end
end
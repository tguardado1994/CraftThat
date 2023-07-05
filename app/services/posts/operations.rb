module Posts
    module Operations
      def self.new_post(params, current_user)
        post = current_user.posts.new(content: params[:content], image_path: params[:image_path])
        return ServiceContract.success(post) if post.save
  
        ServiceContract.error(post.errors.full_messages)
      end
  
      def self.update_post(params)
        post = Post.find(params[:id])
        return ServiceContract.success(post) if post.update(content: params[:content], image_path: params[:image_path])
  
        ServiceContract.error(post.errors.full_messages)
      end
    end
  end
  
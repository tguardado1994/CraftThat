module Api 
    module V1
        class PostsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[home show]
            
            def create 
                result = Posts::Operations.new_post(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    blog: BlogBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def index
                posts = Post.all 
                payload = {
                    posts: PostBlueprint.render_as_hash(posts),
                    status: 200
                }
                render_success(payload: payload)
            end

            def show
                posts = Post.find(params[:id])

                payload ={
                    blog: PostBlueprint.render_as_hash(post),
                    status: 200
                }
                render_success(payload: payload)
            end

            def update
                result = Posts::Operations.update_post(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    post: PostBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destory
                post = Post.find(params[:id])

                post.destroy
                render_success(payload: "Post has been deleted", status: 200)
            end
            
        
        end
    end
end
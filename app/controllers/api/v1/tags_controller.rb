module Api
    module V1
        class TagsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[index]

            def index
                tags = Tag.all 
                payload = {
                    tags: tags
                }
                render_success(payload: payload)
            end

        end
    end
end
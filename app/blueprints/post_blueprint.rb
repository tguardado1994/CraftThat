class PostBlueprint < Blueprinter::Base
    identifier :id
    fields :content, :image_path, :tags, :user
  
  end
  
class Post < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :tags

    validates :content, presence: true
    validates :image_path, presence: true
end

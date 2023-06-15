class CreatePostsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_tags do |t|

      t.belongs_to :post, null:false, foreign_key: true
      t.belongs_to :tag, null:false, foregin_key: true

      t.timestamps
    end
  end
end

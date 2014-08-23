class CreatePosttags < ActiveRecord::Migration
  def change
    create_table :posttags do |t|
      t.string :name
      t.references :post
      t.references :tag
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.references :commentable, polymorphic: true
      t.references :post
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
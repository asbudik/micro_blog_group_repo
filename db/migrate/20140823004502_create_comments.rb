class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :authors
      t.text :content
      t.references :commentable, polymorphic: true
      t.references :post

      t.timestamps
    end
  end
end

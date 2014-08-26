class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :password_digest

      t.timestamps
    end
  end
end

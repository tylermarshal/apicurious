class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :username
      t.string :name
      t.text :bio
      t.string :company
      t.string :location
      t.string :email
      t.string :token
      t.string :last_updated
      t.string :avatar
      t.integer :followers
      t.integer :following
      t.integer :public_repos
      t.timestamps

    end
  end
end

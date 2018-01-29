class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :username
      t.string :name
      t.text :bio
      t.string :company
      t.string :email
      t.string :token
      t.datetime :updated_at

      t.timestamps
    end
  end
end

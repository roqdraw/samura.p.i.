class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password
      t.text :image_url
      t.text :first_name
      t.text :last_name

      t.timestamps
    end
  end
end

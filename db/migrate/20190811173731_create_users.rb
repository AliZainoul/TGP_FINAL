class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age
      t.belongs_to :city, index: true
      # 1 user - 1 city, 1 city - n users ==> 1 city : n users (1:n)
      # Read : 1 user belongs_to 1 city, 1 city has_many n users 
      t.timestamps
    end
  end
end

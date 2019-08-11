class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, index: true
      # 1 user - 1 gossip, 1 user - n gossips ==> 1 user : n gossips (1:n)
      # READ: 1 gossip belongs_to 1 user, 1 user has_many gossips
      t.timestamps
    end
  end
end

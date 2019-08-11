class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, index: true
      # 1 comment - 1 user, 1 user - n comments ==> 1 user : n comments (1:n)
      # Read : 1 comment belongs_to 1 user, 1 user has_many n comments
      t.belongs_to :gossip, index: true
      # 1 comment - 1 gossip, 1 gossip - n comments ==> 1 gossip : n comments (1:n)
      # Read : 1 comment belongs_to 1 gossip, 1 gossip has_many n comments
      t.timestamps
    end
  end
end

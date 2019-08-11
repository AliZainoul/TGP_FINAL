class CreateJoinTableGossipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_gossip_tags do |t|
      t.belongs_to :tag, index: true
      # Read : 1 tag (not necessary) belongs_to 1 gossip, 1 gossip (may have) has_many n tags
      t.belongs_to :gossip, index: true
      # Read : 1 gossip (minimum) belongs_to 1 tag, 1 tag (may have) has_many n gossips
      t.timestamps
    end
  end
end

class CreateVotes < ActiveRecord::Migration

  def change
    create_table :votes do |t|
      t.column :user_id, :integer
      t.integer :votable_id
      t.string  :votable_type
      t.timestamps null: false
    end
    add_index :votes, :user_id
    add_index :votes, [:votable_id, :votable_type]
  end

end

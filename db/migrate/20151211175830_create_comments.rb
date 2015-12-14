class CreateComments < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.column :text, :string
      t.column :commentable_id, :integer
      t.column :commentable_type, :string
      t.timestamps null: false
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end

end

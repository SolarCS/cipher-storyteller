class CreateStories < ActiveRecord::Migration

  def change
    create_table :stories do |t|
      t.column :description, :string
      t.column :requester_id, :integer
      t.column :title, :string
      t.column :type_id, :integer
      t.timestamps null: false
    end
  end

end

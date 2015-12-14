class CreateStoryTypes < ActiveRecord::Migration

  def change
    create_table :story_types do |t|
      t.column :name, :string
      t.timestamps null: false
    end
    add_index(:story_types, :name)
  end

end

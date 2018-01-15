class CreateFollowRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :follow_relationships do |t|
      t.integer :follow_by_id, null: false
      t.integer :follow_to_id, null: false
      t.timestamps
    end
    add_foreign_key :follow_relationships, :users, column: :follow_by_id
    add_foreign_key :follow_relationships, :users, column: :follow_to_id
    add_index :follow_relationships, [:follow_by_id, :follow_to_id], unique: true
  end
end

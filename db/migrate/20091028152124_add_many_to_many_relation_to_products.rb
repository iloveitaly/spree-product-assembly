class AddManyToManyRelationToProducts < ActiveRecord::Migration
  def change
    create_table :assemblies_parts, :id => false do |t|
      t.integer :assembly_id, :null => false
      t.integer :part_id, :null => false
      t.integer :count, :null => false, :default => 1
    end
  end
end

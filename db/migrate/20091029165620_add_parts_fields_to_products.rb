class AddPartsFieldsToProducts < ActiveRecord::Migration
  def self.up
    table = table_exists?(:products) ? 'products' : 'spree_products'
    change_table(table) do |t|
      t.column :can_be_part, :boolean, :default => false, :null => false
      t.column :individual_sale, :boolean, :default => true, :null => false
    end  
  end

  def self.down
    table = table_exists?(:products) ? 'products' : 'spree_products'
    change_table(table) do |t|
      t.remove :can_be_part
      t.remove :individual_sale
    end
  end
end

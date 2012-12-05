class NamespaceProductAssemblyForSpreeOne < ActiveRecord::Migration
  def change
    rename_table :assemblies_parts, :spree_assemblies_parts
  end
end

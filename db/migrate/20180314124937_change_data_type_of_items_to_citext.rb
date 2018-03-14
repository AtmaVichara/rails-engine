class ChangeDataTypeOfItemsToCitext < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'

    change_column :items, :name, :citext
    change_column :items, :description, :citext
  end
end

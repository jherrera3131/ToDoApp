class AddBoostToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :boost, :boolean, default: false
  end
end

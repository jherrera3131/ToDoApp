class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :priority, default: false, null: false
      t.boolean :completed, default: false, null: false
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end

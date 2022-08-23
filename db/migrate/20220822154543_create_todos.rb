class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title 
      t.text :description 
      t.integer :category_id
      t.timestamps #gives created_at and updated_at attributes
    end
  end
end

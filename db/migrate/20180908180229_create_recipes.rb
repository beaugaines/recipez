class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :cuisine
      t.string :category
      t.string :time
      t.integer :serving_size

      t.timestamps
    end
  end
end

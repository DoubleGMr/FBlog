class CreateAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.string :introduce
      t.string :knowledge
      t.text :exception
      t.text :contact

      t.timestamps
    end
  end
end

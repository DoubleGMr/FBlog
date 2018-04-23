class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
    add_index :administrators, :email, unique: true
  end
end

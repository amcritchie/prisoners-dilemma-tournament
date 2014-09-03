class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :codename
      t.text :code
      t.integer :score

      t.timestamps
    end
  end
end

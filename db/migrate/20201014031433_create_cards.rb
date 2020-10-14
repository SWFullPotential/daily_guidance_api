class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :type
      t.string :name_short
      t.string :name
      t.integer :value
      t.string :meaning_up
      t.string :meaning_rev

      t.timestamps
    end
  end
end

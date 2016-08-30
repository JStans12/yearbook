class CreateIdentifications < ActiveRecord::Migration[5.0]
  def change
    create_table :identifications do |t|
      t.integer :person_id
      t.boolean :solved

      t.timestamps
    end
  end
end

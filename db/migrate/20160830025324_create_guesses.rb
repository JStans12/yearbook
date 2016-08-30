class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :identification_id
      t.string :hypothesis

      t.timestamps
    end
  end
end

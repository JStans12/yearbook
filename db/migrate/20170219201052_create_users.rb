class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :census_id 
      t.string :first_name
      t.string :last_name
      t.string :access_token

      t.timestamps
    end
  end
end

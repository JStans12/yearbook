class AddCensusIdToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :census_id, :string
  end
end

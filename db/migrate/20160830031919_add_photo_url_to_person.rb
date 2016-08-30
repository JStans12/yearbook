class AddPhotoUrlToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :photo_url, :string
  end
end

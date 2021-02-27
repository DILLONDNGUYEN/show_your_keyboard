class CreateImagesTab < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|    
      t.string :url
      t.string :image
      t.integer :user_id
      t.text :file
      t.text :caption
    end
  end
end

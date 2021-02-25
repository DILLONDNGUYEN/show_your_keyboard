class ImagesTab < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|    
      t.string :url
      t.integer :user_id
      t.text :file
      t.text :caption
    end
  end
end

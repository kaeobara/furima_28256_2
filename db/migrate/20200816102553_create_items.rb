class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :item_image_id,                null: false      
      t.string :name,                         null: false      
      t.text :introduction,                   null: false      
      t.integer :category_id,                 null: false      
      t.integer :item_condition_id,           null: false      
      t.integer :postage_payer_id,            null: false      
      t.integer :prefecture_id,               null: false      
      t.integer :shipping_days_id,            null: false      
      t.integer :price,                       null: false      
      t.references :user,                     foreign_key: true
      t.timestamps
    end
  end
end

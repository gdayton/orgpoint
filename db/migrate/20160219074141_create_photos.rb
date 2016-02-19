class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.references :user, index: true, foreign_key: true
      t.attachment :image

      t.timestamps null: false
    end
  end
end

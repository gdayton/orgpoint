class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.references :company, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end

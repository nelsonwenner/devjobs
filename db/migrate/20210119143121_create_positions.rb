class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :slug
      t.string :name
      t.integer :career, default: 0
      t.integer :contract, default: 0
      t.boolean :remote, default: false
      t.string :country
      t.string :state
      t.string :city
      t.text :summary
      t.text :description
      t.boolean :publish, default: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end

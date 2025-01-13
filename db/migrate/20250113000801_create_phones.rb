class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.string :number
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end

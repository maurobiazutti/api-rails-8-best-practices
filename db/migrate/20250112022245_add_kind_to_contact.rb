class AddKindToContact < ActiveRecord::Migration[8.0]
  def change
    add_reference :contacts, :kind, null: false, foreign_key: true
  end
end

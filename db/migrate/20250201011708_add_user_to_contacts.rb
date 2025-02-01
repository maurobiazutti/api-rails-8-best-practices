class AddUserToContacts < ActiveRecord::Migration[8.0]
  def change
    add_reference :contacts, :user, null: false, foreign_key: true
  end
end

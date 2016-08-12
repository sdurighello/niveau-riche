class AddUserToSubmarines < ActiveRecord::Migration[5.0]
  def change
    add_reference :submarines, :user, index: true, foreign_key: true
  end
end

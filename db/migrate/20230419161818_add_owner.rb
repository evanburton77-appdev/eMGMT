class AddOwner < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :owner, :string
  end
end

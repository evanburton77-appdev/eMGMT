class AddFromColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :from_agent_id, :integer
  end
end

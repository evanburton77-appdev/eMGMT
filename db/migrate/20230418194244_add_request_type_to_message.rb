class AddRequestTypeToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :request_type, :boolean
  end
end

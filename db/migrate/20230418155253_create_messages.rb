class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :agent_id
      t.string :content
      t.string :subject
      t.boolean :read_receipt_user
      t.boolean :read_receipt_manager
      t.string :reaction_user
      t.string :reaction_manager

      t.timestamps
    end
  end
end

class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :title
      t.integer :user_id
      t.integer :agent_id
      t.string :description
      t.string :industry

      t.timestamps
    end
  end
end

class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :linkedin_url
      t.string :timezone
      t.string :organization_name
      t.string :about
      t.integer :messages_count
      t.integer :gigs_count

      t.timestamps
    end
  end
end

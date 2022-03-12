class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.integer :amount
      t.string :sender_token
      t.string :recipient_token
      t.string :identity
      t.string :redirect_uri

      t.timestamps
    end
  end
end

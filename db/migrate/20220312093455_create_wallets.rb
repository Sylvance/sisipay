class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.integer :amount
      t.string :sender_token
      t.string :recipient_token
      t.string :checkout_url

      t.timestamps
    end
  end
end

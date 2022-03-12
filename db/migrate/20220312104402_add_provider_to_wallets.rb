class AddProviderToWallets < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :provider, null: false, foreign_key: true
  end
end

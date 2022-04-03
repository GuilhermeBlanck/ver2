class AddAuthenticationTokenToPartners < ActiveRecord::Migration[6.1]
  def change
    add_column :partners, :authentication_token, :string, limit: 30
    add_index :partners, :authentication_token, unique: true
  end
end

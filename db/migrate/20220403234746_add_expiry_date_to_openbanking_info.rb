class AddExpiryDateToOpenbankingInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :openbanking_infos, :expiry_date, :datetime
  end
end

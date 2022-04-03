class CreateOpenbankingInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :openbanking_infos do |t|
      t.string :name
      t.text :data
      t.references :user, null: false, foreign_key: true
      t.datetime :expiration_date

      t.timestamps
    end
  end
end

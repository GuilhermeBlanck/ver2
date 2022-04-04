class CreateParterProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :parter_proposals do |t|
      t.text :data
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end

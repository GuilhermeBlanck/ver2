class CreateUserProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :user_proposals do |t|
      t.text :data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

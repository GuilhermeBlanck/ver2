class CreateAgreements < ActiveRecord::Migration[6.1]
  def change
    create_table :agreements do |t|
      t.text :data
      t.references :partner, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

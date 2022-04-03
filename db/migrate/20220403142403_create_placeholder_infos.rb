class CreatePlaceholderInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :placeholder_infos do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end

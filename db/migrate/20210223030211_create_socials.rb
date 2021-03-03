class CreateSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :socials do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end

class CreateAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :authentications do |t|
      t.string :name, null: false, index: true
      t.string :token, null: false

      t.timestamps
    end
  end
end

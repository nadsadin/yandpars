class CreateTranslateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :translate_menus do |t|
      t.string :from
      t.string :to
      t.string :text
      t.string :result

      t.timestamps
    end
  end
end

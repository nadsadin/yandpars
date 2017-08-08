class CreateParceFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :parce_files do |t|
      t.string :path
      t.text :report

      t.timestamps
    end
  end
end

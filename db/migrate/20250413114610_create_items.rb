class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.text :content

      t.timestamps
    end
  end
end

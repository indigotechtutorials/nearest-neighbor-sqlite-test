class AddEmbeddingsToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :embedding, :binary
  end
end

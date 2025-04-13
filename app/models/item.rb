class Item < ApplicationRecord
  validates_presence_of :content
  has_neighbors :embedding

  after_create_commit :generate_embeddings

private

  def generate_embeddings
    CreateEmbeddingsJob.perform_now(id)
  end 
end

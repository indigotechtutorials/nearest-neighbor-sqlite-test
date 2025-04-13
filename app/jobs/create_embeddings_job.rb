class CreateEmbeddingsJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    item = Item.find(item_id)
    client = Ollama.new(
      credentials: { address: 'http://localhost:11434' },
      options: { server_sent_events: true }
    )

    result = client.embeddings(
        { model: 'llama3.2',
          prompt: item.content }
      )

    item.update(embedding: result[0]["embedding"])
  end
end

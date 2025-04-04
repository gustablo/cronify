class CreateWebhookIntegrations < ActiveRecord::Migration[8.0]
  def change
    create_table :webhook_integrations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url, null: false
      t.string :http_method, null: false
      t.string :request_body, null: false
      t.string :headers, null: false

      t.timestamps
    end
  end
end

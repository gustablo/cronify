class DropUserFromWebhookIntegration < ActiveRecord::Migration[8.0]
  def change
    remove_column :webhook_integrations, :user_id
  end
end

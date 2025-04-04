class CronJobCallback < ApplicationRecord
  belongs_to :cron_job
  delegated_type :integration, types: %w[WebhookIntegration], dependent: :destroy
end

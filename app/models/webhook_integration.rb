class WebhookIntegration < ApplicationRecord
  has_one :cron_job_callback, as: :integration, touch: true
  has_one :cron_job, through: :cron_job_callback
end

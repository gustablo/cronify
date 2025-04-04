class CronJobCallbacksController < ApplicationController
  def create
    @cron_job = CronJob.find params[:cron_job_id]

    integration = nil

    case create_params[:type]
    when "Webhook"
      integration = create_webhook
    when "Discord"
      integration = create_discord
    end

    callback = @cron_job.cron_job_callbacks.new(integration: integration, external_uuid: "123")
    if callback.save
      @cron_job_callback = callback.reload
      respond_to do |format|
        format.turbo_stream
      end
    else
      redirect_to new_cron_job_path, status: :unprocessable_entity
    end
  end

  private

  def create_webhook
    WebhookIntegration.create!(
      url: "https://",
      http_method: "POST",
      request_body: "{}",
      headers: "{}"
    )
  end

  def create_discord
    nil
  end

  def create_params
    params.expect(cron_job_callback: [ :type ])
  end
end

class AddStatusToCronJob < ActiveRecord::Migration[8.0]
  def change
    add_column :cron_jobs, :status, :string, null: false, default: "active"
  end
end

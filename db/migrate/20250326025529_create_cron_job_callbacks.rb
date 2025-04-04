class CreateCronJobCallbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :cron_job_callbacks do |t|
      t.string :external_uuid, null: false
      t.references :cron_job, null: false, foreign_key: true

      t.belongs_to :integration, polymorphic: true, index: true

      t.timestamps
    end
  end
end

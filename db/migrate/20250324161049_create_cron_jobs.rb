class CreateCronJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :cron_jobs do |t|
      t.string :external_uuid, null: false
      t.string :name, null: false
      t.string :expression, null: false
      t.datetime :last_run_at
      t.datetime :next_run_at, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

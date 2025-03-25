# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   [Action, Comedy, Drama, Horror].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by(email_address: 'example@gmail.com')
user.update(password: '123')

CronJob.find_or_create_by(
  external_uuid: 'uuid',
  name: 'First Cron',
  expression: '* * * 1 2',
  last_run_at: Time.now,
  next_run_at: Time.now + 30.minutes,
  user_id: user.id
)

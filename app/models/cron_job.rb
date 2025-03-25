class CronJob < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  validates :expression, presence: true
  validate :validate_expression

  validates :next_run_at, presence: true
  validate :next_run_at_cannot_be_in_the_past

  validates :external_uuid, presence: true, uniqueness: true

  validates :status, presence: true
  validates :status, inclusion: { in: %w[active paused] }

  private

  def validate_expression
    CronParser.new(expression)
  rescue
    errors.add(:expression, "is invalid")
  end

  def next_run_at_cannot_be_in_the_past
    if next_run_at.present? && next_run_at < Time.now
      errors.add(:next_run_at, "can't be in the past")
    end
  end
end

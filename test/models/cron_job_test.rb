require "test_helper"

class CronJobTest < ActiveSupport::TestCase
  setup do
    @cron_job = cron_jobs(:one)
  end

  test "should save with correct attributes" do
    assert_equal @cron_job.touch, true
  end

  test "required fields must be filled" do
    fields = %i[name expression external_uuid next_run_at status]

    fields.each do |field|
      @cron_job[field] = nil
    end

    @cron_job.save

    fields.each do |field|
      assert_equal @cron_job.errors.messages[field].first, "can't be blank"
    end
  end

  test "expression must be valid" do
    @cron_job.expression = "invalid_expression"
    @cron_job.save

    assert_equal @cron_job.errors.messages_for(:expression).first, "is invalid"
  end

  test "next_run_at can't be in the past" do
    @cron_job.next_run_at = 1.year.ago
    @cron_job.save

    assert_equal @cron_job.errors.messages_for(:next_run_at).first, "can't be in the past"
  end

  test "status must be valid" do
    @cron_job.status = :invalid
    @cron_job.save

    assert_equal @cron_job.errors.messages_for(:status).first, "is not included in the list"
  end

  test "external_uuid must be unique" do
    new_cron = @cron_job.dup
    assert_equal new_cron.save, false
    assert_equal new_cron.errors.messages_for(:external_uuid).first, "has already been taken"
  end
end

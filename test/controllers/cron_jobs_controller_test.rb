require "test_helper"

class CronJobsControllerTest < ActionDispatch::IntegrationTest
  test "GET #index" do
    sign_in(users(:one))

    get cron_jobs_url

    assert_response :success
  end

  test "GET #new" do
    sign_in(users(:one))

    get new_cron_job_url

    assert_response :success
  end

  test "POST #create" do
    sign_in(users(:one))

    assert_difference("CronJob.count") do
      post cron_jobs_url, params: { cron_job: { name: "My Cron Job", expression: "* * * * *" } }
    end
  end

  test "GET #edit" do
    sign_in(users(:one))

    get edit_cron_job_url(cron_jobs(:one))

    assert_response :success
  end

  test "PATCH #update" do
    sign_in(users(:one))

    cron_job = cron_jobs(:one)

    assert_changes -> { cron_job.reload.name } do
      patch cron_job_url(cron_job), params: { cron_job: { name: "My Updated Cron Job" } }
    end

    assert_redirected_to cron_jobs_url
  end

  test "DELETE #destroy" do
    sign_in(users(:one))

    cron_job = cron_jobs(:one)

    assert_changes -> { cron_job.reload.status } do
      delete cron_job_url(cron_job)
    end
  end

  test "GET #show" do
    sign_in(users(:one))

    get cron_job_url(cron_jobs(:one))

    assert_response :success
  end
end

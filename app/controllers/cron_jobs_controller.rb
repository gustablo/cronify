class CronJobsController < ApplicationController
  before_action :require_authentication

  def index
    @cron_jobs = Current.user.cron_jobs.order(id: :desc)
  end

  def new
    @cron_job = Current.user.cron_jobs.build
  end

  def create
    @cron_job = Current.user.cron_jobs.build(params.expect(cron_job: [ :name, :expression ]))
    @cron_job.next_run_at = Time.now + 1.year
    @cron_job.external_uuid = Time.now.to_i.to_s

    if @cron_job.save
      redirect_to cron_jobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cron_job = Current.user.cron_jobs.find(params[:id])
  end

  def update
    @cron_job = Current.user.cron_jobs.find(params[:id])

    if @cron_job.update(params.expect(cron_job: [ :name, :expression ]))
      redirect_to cron_jobs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cron_job = Current.user.cron_jobs.find(params[:id])
    @cron_job.status = :paused

    @cron_job.save!

    redirect_to cron_jobs_path
  end

  def show
    @cron_job = CronJob.find params[:id]
  end
end

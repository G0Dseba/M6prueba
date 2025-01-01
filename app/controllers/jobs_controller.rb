class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  def apply
    @job = Job.find(params[:id])
    current_user.applications.create(job: @job)
    # Aquí puedes añadir la lógica para enviar una notificación a Esteban
    redirect_to @job, notice: 'Your application has been submitted.'
  end

  private

  def admin_only
    redirect_to(root_path) unless current_user.admin?
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end
  
  def apply
    @job = Job.find(params[:id])
    application = current_user.applications.create(job: @job)
    UserMailer.new_application_notification(application).deliver_now
    redirect_to @job, notice: 'Your application has been submitted.'
  end
  
end

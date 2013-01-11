class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  helper_method :project
  before_filter :authenticate_user!
  def index
    jobs = Job.where(:project_id => params[:project_id]).by_time
    @job = Job.new
    @active = jobs.unfinished
    @done = jobs.finished

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @jobs }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = project.jobs.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to project_jobs_path(project), notice: 'Job was successfully created.' }
        #format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        #format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = project.jobs.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to project_jobs_path(project), notice: 'Job was successfully updated.' }
        format.js
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = project.jobs.find(params[:id])
    @job.destroy

  end

  private
    def project
      @project ||=Project.find(params[:project_id])
    end
end

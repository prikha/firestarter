class ProjectsController <ApplicationController
  before_filter :authenticate_user!
  def index
    @projects = Project.all

  end

  def create
  @project = project.new(project)
  respond_to do |format|
    if @project.save
      format.html { redirect_to project_path notice: 'Project was successfully created.' }
      #format.json { render json: @job, status: :created, location: @job }
    else
      format.html { render action: "new" }
      #format.json { render json: @job.errors, status: :unprocessable_entity }
    end
  end

end
end
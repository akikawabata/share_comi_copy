class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
    #チームに所属しているメンバー全員
    # byebug
    @members = Member.where(team_id: current_member.team_id)
    Rails.logger.debug(@members.inspect)
  end

  def create
    @project = Project.new(project_params)
    @members = Member.where(team_id: current_member.team_id)
    if @project.save
       # @recipe.saveでrecipeもingredientも同時に保存しています
      redirect_to public_projects_path(id: current_member)
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to public_projects_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to public_projects_path
  end

  def status
  end

  def draft
  end

  private

  def project_params
    # 子のモデル:member_tasks_attributes
    # :id, :_destroyで、編集,削除可能
    params.require(:project).permit(
      :members_id, :project_name, :project_details, :start_date_time, :end_date_time,
       member_tasks_attributes:[:id, :member_id, :task, :_destroy] )#受け取れるカラムだけ記述
  end
end
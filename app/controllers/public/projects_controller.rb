class Public::ProjectsController < ApplicationController
  def new
    @project = Project.new
    @members = Member.where(team_id: current_member.team_id)
    Rails.logger.debug(@members.inspect)
  end

  def create
    @members = Member.where(team_id: current_member.team_id)
    @project = Project.new(project_params)
    @project.team_id = current_member.team_id # team_idを現在のメンバーのteam_idで設定する
    @project.public_status = params[:project][:public_status]
    if params[:project][:public_status] == "true" #trueで設定されたら
      if @project.save(context: :publicize)
        redirect_to public_project_path(@project), notice: "追加しました。"
      else
        flash[:notice] = "追加できませんでした。入力内容をご確認のうえ再度お試しください。"
        render :new
      end
      else
        @project.public_status = false

      if @project.save
        redirect_to public_project_candidates_path(current_member), notice: "下書き保存しました。"
      else
        render :new, notice: "追加できませんでした。入力内容をご確認のうえ再度お試しください。"
      end
    end
  end

  def index
    #管理者に紐付けられたプロジェクト
    @projects = Project.where(public_status: true, team_id: current_member.team_id)
  end

  def show
    @project = Project.find(params[:id])
    @member_task = MemberTask.where(project_id: params[:id])
    @member = @member_task.first&.member
    @member_project = @project.member
    @member_tasks = MemberTask.where(member_id: current_member.id)
    @member_edit = Project.where(member_id: current_member.id)
    @post_comment = PostComment.new
  end

  def edit
    @project = Project.find(params[:id])
    @members = Member.where(team_id: current_member.team_id)
  end

  def update
    @project = Project.find(params[:id])
    if  @project.update(project_params)
      flash[:notice] = "更新しました"
      redirect_to public_project_path(@project.id)
    else
      render :edit
    end
  end

def destroy
    @project = Project.find(params[:id])
    Project.destroy(params[:id])
    redirect_to public_member_tasks_path
end

  def status
  end

  def draft
    @project = Project.new
    @projects = Project.where(member_id: current_member.id, public_status: false)
    @project_drafts = Project.where(member_id: current_member.id, public_status: true)
  end

  private

  def project_params
    params.require(:project).permit(
      :member_id, :project_name, :project_details, :start_date_time, :end_date_time, :public_status,
      member_tasks_attributes:[:id, :member_id, :task, :_destroy]
    )
  end
end
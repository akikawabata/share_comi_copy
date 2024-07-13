class Public::MemberTasksController < ApplicationController

  def index
    @member_tasks = current_member.member_tasks.where(making_status: ['not_started_yet', 'under_construction']).joins(:project).where(projects: { public_status: true })
  end


  def update
    @member_task = MemberTask.find(params[:id])
    @project = @member_task.project
    if @member_task.update(member_task_params)
      flash[:notice] = "ステータスを更新しました"
      redirect_to public_project_path(@project)
    else
      flash[:alert] = "ステータスの更新に失敗しました"
      redirect_to public_project_path(@project)
    end
  end

  private

  def member_task_params
    params.require(:member_task).permit(:making_status)
  end
end

# テスト
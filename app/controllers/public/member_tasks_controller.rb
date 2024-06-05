class Public::MemberTasksController < ApplicationController
  def new
    @project = Project.new
    自分の所属しているメンバーのアカウント一覧
    @members = Member.where(team_id: current_member.team_id)
  end

  def create
  #メンバーが新しく作った企画を保存する
    if project = Project.new(project_params)
      project.save
      redirect_to public_projects_path
    else
      render :new
    end
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
end
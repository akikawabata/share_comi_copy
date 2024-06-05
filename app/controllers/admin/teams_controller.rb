class Admin::TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    team.admin_id = current_admin.id
    team.save
    redirect_to admin_teams_path
  end

  def index
  #ログインしている管理者ユーザー(adminモデルから見つけてくる)/チーム一覧(見つけてきた対象のチーム一覧)アソシエーション
    @admin = Admin.find(current_admin.id)
    @teams = @admin.teams
  end

  def show
    # redirect_to admin_teams_destroy_path
  end

  def edit
    @team =Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to admin_teams_path
  end

  def confirm
    @team = Team.find(params[:id])
    #     team.destroy
    # redirect_to admin_teams_path
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to admin_teams_path
  end

  private
  # ストロングパラメータ
  def team_params
  params.require(:team).permit(:team_name)
  end
end
class Admin::TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    team.admin_id = current_admin.id
    team.save
    Rails.logger.info "ログ：新規チームを制作"
    redirect_to admin_teams_path, notice: "チームを追加しました。右上の「メンバー追加」からメンバーを追加してチームの選択をしてください"
  end

  def index
  #ログインしている管理者ユーザー(adminモデルから見つけてくる)/チーム一覧(見つけてきた対象のチーム一覧)アソシエーション
    @admin = Admin.find(current_admin.id)
    @teams = @admin.teams
  end

  def show
    # チームに所属しているメンバー
    @team = Team.find(params[:id])
    @members = @team.members
    Rails.logger.info "ログ：チームの詳細画面ページに遷移"
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
    # byebug
    @team.destroy
    redirect_to admin_teams_path
  end

  private
  # ストロングパラメータ
  def team_params
  params.require(:team).permit(:team_name)
  end
end
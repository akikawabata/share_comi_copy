class Admin::MembersController < ApplicationController
  # before_action :authenticate_admin!

  def new
    @member = Member.new
    @teams = Team.where(admin_id: current_admin.id)
  end

  def create
    member = Member.new(member_params)
    member.is_active = true
    member.save!
    redirect_to admin_members_path
  end

  def index
    #ログインしている管理者ユーザーが制作したメンバーアカウント
    @admin = Admin.find(current_admin.id)
    @members = @admin.teams.map {|team| team.members }.flatten.uniq
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def destroy
  end

  private
  def member_params
    params.require(:member).permit(:screen_name, :email, :team_id, :is_active, :password, :password_confirmation)
  end
end
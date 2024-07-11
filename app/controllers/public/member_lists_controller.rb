class Public::MemberListsController < ApplicationController

  def index
    #自分が所属しているチームのメンバー一覧
    @members = Member.where(team_id: current_member.team_id)
    #自分が所属しているチーム
    @team = Team.find(current_member.team_id)
  end
  def show
    @member = current_member
  end


  # before_action :ensure_guest_member, only: [:edit]
  # def ensure_guest_member
  #   @member = Member.find(params[:id])
  #   if @member.guest_member?
  #     redirect_to public_members_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
  #   end
  # end

end
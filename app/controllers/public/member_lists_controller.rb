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
end
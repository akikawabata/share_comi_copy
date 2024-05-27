class Public::MembersController < ApplicationController
  def new
  end

  def show
    @member = current_member

  end

  def edit
  end

  def update
  end
  
    before_action :ensure_guest_member, only: [:edit]
  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.guest_member?
      redirect_to public_members_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end

class Admin::CustomersController < ApplicationController
    before_action :ensure_guest_member, only: [:edit]
    
  def ensure_guest_admin
    @admin = Admin.find(current_admin)
    if @admin.guest_admin?
      redirect_to admin_path(current_admin) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def show
    @admin = current_admin
  end
end

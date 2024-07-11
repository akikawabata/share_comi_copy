class Admin::MembersController < ApplicationController
  # before_action :authenticate_admin!

  def new
    @member = Member.new
    @teams = Team.where(admin_id: current_admin.id)
  end

  def create
    member = Member.new(member_params)
    member.is_active = true
    if member.save
      redirect_to admin_members_path, notice: "メンバーを追加しました。"
    else
      @member = member
      @teams = Team.where(admin_id: current_admin.id)
    if Member.exists?(screen_name: member.screen_name)
      flash.now[:notice] = "既に存在する名前です。"
    elsif Member.exists?(email: member.email)
      flash.now[:notice] = "既に存在するメールアドレスです。"
    else
      flash.now[:notice] = "未入力、または、未選択の項目があります。"
    end
      render :new
    # 　render :new, alert: "追加できませんでした。入力内容をご確認のうえ再度お試しください"
    end
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
    @member = Member.find(params[:id])
    @teams = Team.where(admin_id: current_admin.id)
  end

def update
  if @member.update(member_params)
    # 画像のアップロード処理を追加
    @member.profile_image.attach(params[:member][:profile_image])
    # 画像の表示部分を追加
    redirect_to @member
  else
    render 'edit'
  end
end

  def confirm
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_active: false)
    flash[:notice] = "退職設定をしました"
    redirect_to admin_members_path
  end

  private

  def member_params
    params.require(:member).permit(:screen_name, :email, :team_id, :is_active, :password, :password_confirmation)
  end
end
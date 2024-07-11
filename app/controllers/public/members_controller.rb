class Public::MembersController < ApplicationController
  def new
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(current_member.id)
  end

  def update
    @member = Member.find(current_member.id)#ユーザーを見つけてくる
    if @member.update(member_params)#もしアップデートのアップデートができたら
      flash[:notice] = "更新しました"
      redirect_to public_member_path # ユーザーぺーじにリダイレクト
    else#もしうまくいかなかったら
     render :edit#もう一度同じページを表示させることによってエラー
    end
  end

  private
  def member_params
    params.require(:member).permit(:screen_name, :email, :team_id,:profile_image)
  end
end

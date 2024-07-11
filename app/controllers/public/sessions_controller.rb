# frozen_string_literal: true
class Public::SessionsController < Devise::SessionsController
  # before_action :reject_member, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # before_action :configure_sign_in_params, only: [:create]


  def create
    if Member.exists?(email: params[:member][:email])
      redirect_to public_member_tasks_path, notice: "メンバーとしてログインしました。"
    else
      flash.now[:alert] = "ログインに失敗しました。正しいメールアドレス・パスワードを入力してください"
      render :new
    end
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "メンバーとしてログインしました"
    public_member_tasks_path
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました"
    root_path
  end

  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to public_member_tasks_path, notice: "メンバーゲストとしてログインしました。"
  end

    def reject_member
    @member = Member.find_by(email: params[:member][:email])
      if @member
        puts @member.is_active # ログに値が表示される
        if @member.valid_password?(params[:member][:password]) && (@member.is_active == false)
          flash[:notice] = "ログインできないアカウントです。管理者にご確認ください"
          redirect_to new_member_session_path
        end
      else
        flash[:notice] = "メールアドレス、または、パスワードが間違っています"
      end
  　 end

  protected

end
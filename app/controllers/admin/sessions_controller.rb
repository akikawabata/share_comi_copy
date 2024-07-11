# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
    before_action :configure_permitted_parameters, if: :devise_controller? 
  # before_action :authenticate_user!に対してunless: :admin_controller?でfalseを返す場合、つまり現在のコントローラーが Admin 名前空間の下にない場合にのみエンドユーザー認証が求められます。
  #上記に「Public::」をつけることで、ruteで使用したscope module: :publicが適用され、URLパスからはpublicが除外されます。したがって、今までと同様にアクセスできるようになります。
  #未ログイン認証状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクト。 また、ログイン認証が済んでいる場合には全てのページにアクセスすることができます
  #before_actionメソッドは最初にbefore_actionメソッドが実行される

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
  
  def guest_sign_in
    admin = Admin.first
    sign_in admin
    redirect_to admin_teams_path, notice: "管理者ゲストとしてログインしました。"
  end
  

  def after_sign_in_path_for(resource)
    flash[:notice] = "管理者としてログインしました"
    admin_teams_path
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました"
    root_path
  end

  protected
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
  
end
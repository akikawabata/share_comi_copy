class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @admin = current_admin
  end

  def edit
     @admin = current_admin
  end

  def update
     @admin = current_admin
    if @admin.update(customers_params)#もしアップデートのアップデートができたら
      flash[:notice] = "更新しました"
      redirect_to admin_customers_path # ユーザーぺーじにリダイレクト
    else#もしうまくいかなかったら
     render :edit#もう一度同じページを表示させることによってエラー
    end
  end

  private
  def customers_params
    params.require(:admin).permit(:company, :company_address, :administrator_name, :email)
  end
end
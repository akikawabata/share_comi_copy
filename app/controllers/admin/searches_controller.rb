class Admin::SearchesController < ApplicationController
  # before_action :authenticate!

  def search
    @model_member = params[:model_member]

    if @model_member == "Member"
      @members = Member.looks(params[:search], params[:word])
    end
  end
end

class Public::SearchesController < ApplicationController
  # before_action :authenticate!

  def search
    @model_project = params[:model_project]

    if @model_project == "Project"
      @projects = Project.looks(params[:search], params[:word])
    end
  end
end
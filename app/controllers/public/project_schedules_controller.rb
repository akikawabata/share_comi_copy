class Public::ProjectSchedulesController < ApplicationController
 
  def index
    @projects = Project.where(public_status: true, team_id: current_member.team_id)
      respond_to do |format|
      format.html
      format.json { render 'calendar' }
    end
  end
  
end
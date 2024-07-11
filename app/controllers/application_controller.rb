class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_sidebar_count, if: :member_signed_in?
    
  def set_sidebar_count
    # @member_tasks_count = MemberTask.where(member_id: current_member.id, making_status: [0, 1]).count
    @member_tasks_count = MemberTask.joins(:project).where(member_id: current_member.id, projects: { public_status: true }).where.not(making_status: 'completion').count
                                  # where(making_status: ['not_started_yet', 'under_construction']).joins(:project).where(projects: { public_status: true })

    @project_drafts_count = Project.where(member_id: current_member.id, public_status: false).count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company, :company_address, :administrator_name, :screen_name, :team, :email])
  end
end
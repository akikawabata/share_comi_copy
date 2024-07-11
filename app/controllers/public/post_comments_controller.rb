class Public::PostCommentsController < ApplicationController

  def create
    project = Project.find(params[:project_id])
    comment = PostComment.new(post_comment_params)
    comment.member_id = current_member.id
    comment.project_id = project.id
    comment.save
    redirect_to public_project_path(project)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      if  comment.save
      redirect_to prototype_path(comment.prototype.id), method: :get
      # redirect_to "/prototypes/#{comment.prototype.id}"  
      # # コメントと結びつくの詳細画面に遷移する
      else
        render prototype_path
      end
    end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end

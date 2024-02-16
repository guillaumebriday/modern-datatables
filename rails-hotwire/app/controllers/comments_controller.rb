# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_todo, only: %i[index]

  def index
    pagy, comments = pagy @todo.comments.order(id: :desc)

    render partial: 'comments/list',
           locals: {
             todo: @todo,
             pagy: pagy,
             comments: comments
           }
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render turbo_stream: [
        turbo_stream.prepend('comments', partial: 'comments/comment', locals: { comment: comment }),
        turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: Comment.new(todo: comment.todo) }),
        turbo_stream.update('comments_count', comment.todo.comments.count),
        turbo_stream.remove('no_content')
      ]
    else
      render turbo_stream: [
        turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: comment })
      ]
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def comment_params
    params.require(:comment).permit(:description, :todo_id)
  end
end

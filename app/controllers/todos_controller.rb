# frozen_string_literal: true

class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:description))
    return unless @todo.save

    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_path }
    end
  end
end


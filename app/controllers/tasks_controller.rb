class TasksController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  respond_to :html
  respond_to :js, only: [ :create, :update, :destroy ]

  def create
    @task = CreateTask.create(params[:task].merge(user_id: current_user.id))
    if @task.errors.present?
      render :new
    else
      create!
    end
  end

  def index
    @tasks = @tasks.limit(10)
  end
end


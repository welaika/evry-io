class TasksController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource
  inherit_resources

  respond_to :html
  respond_to :js, only: [ :create, :update, :destroy ]

  def create
    @task = CreateTask.create(params[:task].merge(user_id: current_user.id))
    if @task.errors.present?
      flash[:alert] = @task.errors.full_messages.first
      render 'new'
    else
      create!
    end
  end

  def update
    @task = Task.find(params[:id])
    UpdateTask.new(@task).perform(params[:task])
    update!
  end

  def index
    @tasks = @tasks.by_next_at.page(params[:page])
    @task = Task.new
  end

  def duplicate
    task = Task.find(params[:id])

    if task
      @task = Task.new(action: task.action, time_expression: task.time_expression)
      render "new"
    else
      flash[:alert] = "Can't duplicate not existing task"
      redirect_to tasks_url
    end
  end
end


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
      render :new
    else
      create!
    end
  end

  def index
    @tasks = @tasks.limit(10)
  end
end


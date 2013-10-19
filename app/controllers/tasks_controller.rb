class TasksController < ApplicationController
  inherit_resources

  respond_to :html, only: [ :index, :new, :edit ]
  respond_to :js, only: [ :create, :update, :destroy ]

  def create
    @task = CreateTask.create(params[:task])
    create!
  end
end

class TasksController < ApplicationController

  def new
    # @task.task_list_id = @task_list.id
    # @users = User.all

    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    due_date = Date.new(
      params[:task]["date(1i)"].to_i,
      params[:task]["date(2i)"].to_i,
      params[:task]["date(3i)"].to_i
    )

    # @task_list = TaskList.find(params[:task_list_id])
    # @users = User.all
    # @task.task_list_id = params[:task_list_id]
    @task = Task.new(description: params[:task][:description], date: due_date, task_list_id: params[:task_list_id])

    if @task.save
      redirect_to root_path

      flash[:notice]= "Task was created successfully!"

    else
      @task_list = TaskList.find(params[:task_list_id])
      # @users = User.all
      @task.errors[:base] << "Your task could not be created"
      render :new
    end
  end



end
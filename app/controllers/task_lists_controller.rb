class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def show
    @task_lists = TaskList.find(params:id)
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(name: params[:task_list][:name]) #nested hash!!!
    if @task_list.save
      redirect_to root_path

      flash[:notice]= "Task List was created successfully!"

    else
      @task_list.errors[:base] << "Your task could not be created"
      render :new
    end
  end

  def edit
    @task_lists = TaskList.find(params:id)
  end



end
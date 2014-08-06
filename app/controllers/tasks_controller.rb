class TasksController < ApplicationController


  def new
    @task = Task.new
  end

  def create
    due_date = Date.new(
      params[:task]["date(1i)"].to_i,
      params[:task]["date(2i)"].to_i,
      params[:task]["date(3i)"].to_i
    )

    @task = Task.new(description: params[:task][:description], date: due_date)

    if @task.save
      redirect_to root_path

      flash[:notice]= "Task was created successfully!"

    else
      @task.errors[:base] << "Your task could not be created"
      render :new
    end
  end



end
class TasksController < ApplicationController

  # GET http://localhost:3000/tasks
  def index
    @tasks = Task.all
  end

  # GET http://localhost:3000/tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET http://localhost:3000/tasks/1
  def new
    @task = Task.new
  end

  # POST http://localhost:3000/tasks
  def create
    # params[:task] => {"title"=>"teste1", "details"=>"detalhes", "completed"=>"false"}

    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  # GET http://localhost:3000/tasks/3/edit
  def edit
    @task = Task.find(params[:id])
  end

  # PATCH http://localhost:3000/tasks/3
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # DELETE http://localhost:3000/tasks/3
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end

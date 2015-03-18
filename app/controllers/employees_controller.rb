class EmployeesController < ApplicationController
	before_filter :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all
    # render json: @employees
  end

  def new
    @employee = Employee.new
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    
    x = employee_params[:birthdate]
    params[:employee][:birthdate] = Date.strptime(x, '%m/%d/%Y')

    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = 'Employee was successfully created.'
      redirect_to employees_path
    else
      flash[:error] = 'An error occured while creating new employee.'
      render 'new'
    end
  end

  def update
    x = employee_params[:birthdate]
    params[:employee][:birthdate] = Date.strptime(x, '%m/%d/%Y')
    if @employee.update(employee_params)
      flash[:success] = 'Employee was successfully updated.'
      redirect_to employees_path
    else
      flash[:error] = 'An error occured while creating new employee.'
      render 'new'
    end
  end
  
  def destroy
    @employee.destroy!
    flash[:success] = 'Employee has been deleted.' 
    redirect_to employees_path
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end
      
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :middle_initial, :address, :contact_number, :birthdate, :position, :monthly_basic, :semi_month_rate)
    end
end
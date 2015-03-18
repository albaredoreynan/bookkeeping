class PayrollRecordsController < ApplicationController
  before_filter :set_payroll_record, only: [:show, :update, :destroy]

  def index
    @payroll_records = PayrollRecord.all
    # render json: @payroll_records
  end

  def new
    @payroll_record = PayrollRecord.new
  end
  
  def edit
    @payroll_record = PayrollRecord.find(params[:id])
  end

  def create
    x = payroll_record_params[:payroll_date_start]
    y = payroll_record_params[:payroll_date_end]
    params[:payroll_record][:payroll_date_start] = Date.strptime(x, '%m/%d/%Y')
    params[:payroll_record][:payroll_date_end] = Date.strptime(y, '%m/%d/%Y')

    @payroll_record = PayrollRecord.new(payroll_record_params)

    if @payroll_record.save
      flash[:success] = 'PayrollRecord was successfully created.'
      redirect_to payroll_records_path
    else
      flash[:error] = 'An error occured while creating new payroll_record.'
      render 'new'
    end
  end

  def update
    x = payroll_record_params[:payroll_date_start]
    y = payroll_record_params[:payroll_date_end]
    params[:payroll_record][:payroll_date_start] = Date.strptime(x, '%m/%d/%Y')
    params[:payroll_record][:payroll_date_end] = Date.strptime(y, '%m/%d/%Y')

    if @payroll_record.update(payroll_record_params)
      flash[:success] = 'PayrollRecord was successfully updated.'
      redirect_to payroll_records_path
    else
      flash[:error] = 'An error occured while creating new payroll_record.'
      render 'new'
    end
  end
  
  def destroy
    @payroll_record.destroy!
    flash[:success] = 'PayrollRecord has been deleted.' 
    redirect_to payroll_records_path
  end

  private

    def set_payroll_record
      @payroll_record = PayrollRecord.find(params[:id])
    end
      
    def payroll_record_params
      params.require(:payroll_record).permit(:payroll_date_start, :payroll_date_end)
    end
end

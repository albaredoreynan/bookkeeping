class AccountInfosController < ApplicationController
	before_filter :set_account_info, only: [:show, :update, :destroy]
  def index
    @account_infos = AccountInfo.where(payroll_record_id: params[:payroll_record_id])
    # render json: @account_infos
  end

  def new
    @account_info = AccountInfo.new
  end
  
  def edit
    @account_info = AccountInfo.find(params[:id])
  end

  def create
    @account_info = AccountInfo.new(account_info_params)

    if @account_info.save
      flash[:success] = 'AccountInfo was successfully created.'
      redirect_to account_infos_path(:payroll_record_id => @account_info.payroll_record_id)
    else
      flash[:error] = 'An error occured while creating new account_info.'
      render 'new'
    end
  end

  def update
    if @account_info.update(account_info_params)
      flash[:success] = 'AccountInfo was successfully updated.'
      redirect_to account_infos_path(:payroll_record_id => @account_info.payroll_record_id)
    else
      flash[:error] = 'An error occured while creating new account_info.'
      render 'new'
    end
  end
  
  def destroy
    @account_info.destroy!
    flash[:success] = 'AccountInfo has been deleted.' 
    redirect_to account_infos_path
  end

  def view_payroll
    @account_infos = AccountInfo.where(payroll_record_id: params[:payroll_record_id])
    @payroll_date = PayrollRecord.find(params[:payroll_record_id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Payroll Sheet",
              :orientation  => 'Landscape',
              :page_width   => '13in',
              :margin => {:top       => 1,
                           :bottom   => 1}
      end
    end
  end

  private

    def set_account_info
      @account_info = AccountInfo.find(params[:id])
    end
      
    def account_info_params
      params.require(:account_info).permit(:employee_id, :overtime_pay, :late, :gross_pay, :pagibig_wheld, :gross_pay_after_hdmf,
      	:tax_wheld, :pag_ibig_loan, :housing_loan_sp_case, :advances, :company_loan, :total_deduction, :payroll_record_id)
    end
end
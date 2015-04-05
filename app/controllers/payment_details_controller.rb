class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  respond_to :html

  def index 
    @payment_details = PaymentDetail.all
    if current_user.email != "admin@ncrtet2015.com"
      if @payment_details.find_by_user_id(current_user.id)
        
      else
        redirect_to new_payment_detail_path
      end
    else
      respond_to do |format|
        format.html
        format.xlsx
      end
    end  
  end

  def show
    respond_with(@payment_detail)
  end

  def new
    @payment_detail = PaymentDetail.new

    respond_with(@payment_detail)
  end

  def edit
  end

  def create
    @payment_detail = PaymentDetail.new(payment_detail_params)
    @payment_detail.user_id = current_user.id
    if current_user.designation == "Student"  
      @payment_detail.amount = 600
    elsif current_user.designation == "Faculty Member" 
      @payment_detail.amount = 800
    elsif current_user.designation == "Delegates" 
      @payment_detail.amount = 1000
    end
    @payment_detail.save
    if @payment_detail.save
      @payment_detail.user_number = "C15#{@payment_detail.id}"
      @payment_detail.save
      # RegistrationMailer.registration_success(@registration).deliver_now
      # format.html { redirect_to papers_path, notice: 'Paper was successfully Uploaded.' }
      # format.json { render :show, status: :created, location: @paper }
    else
      # flash[:notice] = "Post successfully created"
    end
    redirect_to payment_details_path   
  end

  def update
    @payment_detail.update(payment_detail_params)
    respond_with(@payment_detail)
  end

  def destroy
    @payment_detail.destroy
    respond_with(@payment_detail)
  end

  private
    def set_payment_detail
      @payment_detail = PaymentDetail.find(params[:id])
    end

    def payment_detail_params
      params.require(:payment_detail).permit(:amount, :dd_number, :bank, :branch,:dd_copy)
    end
end

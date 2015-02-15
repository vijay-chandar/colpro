class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  respond_to :html

  def index
    @payment_details = PaymentDetail.all
    if current_user.email != "admin@sjit.com"
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
    redirect_to papers_details_path   
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

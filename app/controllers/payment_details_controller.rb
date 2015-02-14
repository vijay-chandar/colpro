class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  respond_to :html

  def index
    @payment_details = PaymentDetail.all
    respond_with(@payment_details)
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
    @payment_detail.save
    respond_with(@payment_detail)
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
      params.require(:payment_detail).permit(:amount, :dd_number, :bank, :branch)
    end
end

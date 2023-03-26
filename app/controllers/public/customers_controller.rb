class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
    @post = Post.new
  end

  def index
    @customers = Customer.all
    @customer = Customer.new

    if params[:search].present?
        @customers = Customer.where("customer_name LIKE ?", "%#{params[:search]}%")
    else
        @customers = Customer.all
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
  @customer = current_customer
  @customer.destroy
  redirect_to "/", notice: "退会処理が完了しました。ご利用ありがとうございました。"
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :profile, :image)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to public_customer_path(current_customer)
    end
  end
end
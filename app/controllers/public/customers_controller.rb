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
class Admin::CustomersController < ApplicationController 
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
    @post = Post.new
  end

  def index
    @customers = Customer.all
    @customer = Customer.new
    
    if params[:search]
    @users = Customer.search(params[:search])
    else
    @users = Customer.all
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

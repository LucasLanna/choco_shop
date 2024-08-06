class OrdersController < ApplicationController
  # def index
  #   @orders = Order.all
  # end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:product_id])
    @order.date = Date.today
    @order.product = @product
    @order.user = current_user
    if params.dig(:order, :quantity).to_i <= @product.stock && @order.save
      redirect_to order_path(@order), notice: 'Order was successfully created.'
    else
      @order.errors.add(:quantity, ' error.') if params.dig(:order, :quantity).to_i > @product.stock
      # redirect_to @product, notice: 'Failed to create order.', status: :unprocessable_entity
      render 'products/show', alert: 'Failed to create order.', status: :unprocessable_entity
    end
  end

  # def edit
  #   @order = Order.find(params[:id])
  # end

  # def update
  #   @order = Order.find(params[:id])
  #   if @order.update(order_params)
  #     redirect_to @order, notice: 'Order was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def order_params
    params.require(:order).permit(:quantity)
  end
end

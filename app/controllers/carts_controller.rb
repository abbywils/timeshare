class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout, :emptycart]
  before_action :require_admin, only: [:index]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    require_appropriate_access(@cart.user)
  end

  def checkout
    require_appropriate_access(@cart.user)
    if params[:cardnumber].length != 16
      redirect_to @cart, notice: 'Checkout failed (invalid card number)'
    else
      total = 0
      @cart.line_items.each do |line_item|
        reservation = Reservation.new(
          site_id: line_item.site.id,
          user_id: @cart.user.id
        )
        reservation.save
        line_item.destroy
        # add cost for this particular line_item 
        total += line_item.site.cost
      end
    
      payment = Payment.new(
        user: @cart.user, # user_id: @cart.user.id,
        total: total
      )
    
      redirect_to @cart, notice: 'Checkout successful. You will receive a confirmation email shortly'
    end
  end
  
  def emptycart
    require_appropriate_access(@cart.user)
    @cart.line_items.each do |line_item|
      line_item.delete
    end
    redirect_to @cart, notice: 'Cart is empty'
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end
end

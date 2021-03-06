class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checkout, only: %i[ show edit update destroy ]

  # GET /checkouts or /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1 or /checkouts/1.json
  def show
    @checkout.sender_token = current_user.auth_token
    @checkout.save
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts or /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to checkout_url(@checkout), notice: "Checkout was successfully created." }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1 or /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to checkout_url(@checkout), notice: "Checkout was successfully updated." }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1 or /checkouts/1.json
  def destroy
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: "Checkout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find_by(redirect_uri: "https://sisipay.herokuapp.com/checkouts/#{params[:id]}") || Checkout.find(params[:id])  
    end

    # Only allow a list of trusted parameters through.
    def checkout_params
      params.require(:checkout).permit(:amount, :sender_token, :recipient_token, :identity, :redirect_uri)
    end
end

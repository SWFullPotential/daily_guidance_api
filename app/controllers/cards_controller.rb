class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  def index
    @cards = Card.all
    if @cards 
      render json: @cards
    else
        render json: {
            status: 500, 
            errors: ['no cards found']
        }
    end
  end

  # GET /cards/1
  def show
    @card = User.find(params[:id])
    if @card 
      render json: @card 
    else 
      render json: {
        status: 500, 
        errors: ['user not found']
      }
    end
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card 
    else
      render json: {
        status: 500, 
        errors: @card.errors.full_messages
      }
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      redirect_to @card, notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
    redirect_to cards_url, notice: 'Card was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:card_type, :name_short, :name, :value, :meaning_up, :meaning_rev)
    end
end

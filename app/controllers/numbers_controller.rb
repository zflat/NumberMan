class NumbersController < ApplicationController
  before_action :set_number, only: [:edit, :update, :destroy]

  def index
    @numbers = Number.all
  end

  def new
    @sequence_options  = current_tenant.sequences
    @number ||= Number.new
  end

  def create
    @number = NumberFactory.new(number_params)

    if @number.save
      redirect_to root, notice: 'Number was successfully created.'
    else
      render :new
    end
  end


  # DELETE 
  def destroy
    @number.destroy
    redirect_to numbers_url, notice: 'Number was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.includes(:sequence).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def number_params
      params.require(:number).permit(:descriptor, :sequence_id)
    end

end

class NumbersController < ApplicationController
  before_action :set_number, only: [:edit, :update, :destroy]

  def index
    if seq_id = params[:sequence_id]
      @sequence = Sequence.where(id: seq_id).first
      @numbers = @sequence.numbers
    else
      @sequence_options  = current_tenant.sequences
      @numbers = Number.all
    end
  end

  def new
    @sequence_options  = current_tenant.sequences
    @number ||= Number.new
  end

  def create
    @number = NumberFactory.new(number_params).create

    if @number.valid?
      redirect_to root_path, notice: "Number #{@number.to_s} was successfully created."
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

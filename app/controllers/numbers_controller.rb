class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :update, :destroy]

  def index
    if seq_id = params[:sequence_id]
      @sequence = Sequence.where(id: seq_id).first
      @numbers = @sequence.numbers.page(params[:page]).order('decimal')
    else
      @sequence_options  = current_tenant.sequences
      @numbers = Number.all.includes(:sequence).page(params[:page]).order('sequences.prefix', 'decimal')
    end
  end

  def show
  end

  def new
    @sequence_options  = current_tenant.sequences
    @number ||= Number.new
  end

  # PATCH/PUT /recipes/1
  def update
    if @number.update(number_params)
      redirect_to @number, notice: "#{@number.to_s} was successfully updated."
    else
      render :show
    end
  end

  def create
    @number = NumberFactory.new(number_params).create

    if @number.valid?
      redirect_to number_path(@number), notice: "#{@number.sequence.descriptor} #{@number.to_s} created."
    else
      render :new
    end
  end

  # DELETE 
  def destroy
    @number.destroy
    redirect_to numbers_url, notice: "#{@number.to_s} was successfully destroyed."
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

class RecordsController < ApplicationController
  def index
    render json: Record.all
  end

  def show
    render json: Record.find(params[:id])
  end

  def create
    record = Record.new(record_params)
    if record.save
      render json: record, status: :created
    else
      render json: record.errors, status: :unprocessable_entity
    end
  end

  def update
    record = Record.find(params[:id])
    if record.update(record_params)
      render json: record
    else
      render json: record.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Record.find(params[:id]).destroy
    head :no_content
  end

  private

  def record_params
    params.require(:record).permit(:artist, :album, :year, :price)
  end
end

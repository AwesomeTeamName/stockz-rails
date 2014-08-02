class StockController < ApplicationController
  def index

  end

  def view

  end

  def stocks
    stocks = Stock.all.map do |stock|
      stock.name
    end

    render json: stocks
  end

  def data
    name = params[:name]

    stock = Stock.find_by(name: name)

    if stock.nil?
      render status: 404, text: 'Invalid stock'
      return
    end

    data = stock.stock_data

    if data.nil? #|| data.length == 0
      render status: 404, text: 'Invalid stock'
      return
    end

    render json: stock #data.order(:datetime).reverse.first(10)
  end
end

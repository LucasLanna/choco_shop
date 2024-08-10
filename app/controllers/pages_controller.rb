class PagesController < ApplicationController
  def home
    @products = Product.take(6)
  end
end

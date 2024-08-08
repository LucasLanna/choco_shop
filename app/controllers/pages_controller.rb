class PagesController < ApplicationController
  def home
    @products = Product.take(3)
  end
end

class HomesController < ApplicationController
  def top
    @customers = Customer.all
  end
end

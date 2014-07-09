class HomesController < ApplicationController
  def show
    @store = Store.kristaks
  end
end

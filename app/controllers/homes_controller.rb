class HomesController < ApplicationController
  def show
    @store = Store.kristaks
    @hours = Hour.where(store: @store).sort
  end
end

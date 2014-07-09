class HoursController < ApplicationController
  def edit
    @store = find_store
  end

  def update
    @store = find_store
    hour = @store.hours.find(params[:id])

    hour.update_times(params[:hour])

    if hour.valid?
      redirect_to edit_store_hours_path(@store)
    else
      render :edit
    end
  end

  private

  def find_store
    Store.find(params[:store_id])
  end
end

class FlavorsController < ApplicationController
  def index
    @store = find_store
  end

  def new
    @flavor = Flavor.new
  end

  def create
    store = find_store
    @flavor = store.flavors.create(flavor_params)

    if @flavor.valid?
      redirect_to new_store_flavor_path(store)
    else
      render :new
    end
  end

  def edit
    @flavor = find_flavor
  end

  def update
    @flavor = find_flavor
    @flavor.update(flavor_params)
  end

  def destroy
    flavor = find_flavor
    flavor.destroy
    redirect_to edit_store_flavors_path(flavor.store)
  end

  private

  def find_store
    Store.find(params[:store_id])
  end

  def find_flavor
    Flavor.find(params[:id])
  end

  def flavor_params
    params.require(:flavor).permit(
      :name,
      :description,
      :type,
    )
  end
end

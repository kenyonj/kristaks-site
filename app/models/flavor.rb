class Flavor < ActiveRecord::Base
  belongs_to :store

  TYPES = %w(
    HardServe
    SoftServe
    Smoothie
    Fudge
  )
end

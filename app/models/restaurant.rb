class Restaurant < ApplicationRecord
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :postal_code, presence: true

  belongs_to :owner

  def owner_is? owner
    return owner && owner == self.owner
  end
  
  geocoded_by :address
  after_validation :geocode
  # maybe will need bottom code for updating address
  # => lambda{ |obj| obj.address_changed? && obj.city_changed? && obj.postal_code_changed?}
  # def address_changed
  #   [city, postal_code, address].compact.join(', ')
  # end

end

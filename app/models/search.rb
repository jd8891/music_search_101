class Search < ApplicationRecord
  # Direct associations

  has_one    :saved_song,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end

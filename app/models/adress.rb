class Adress < ApplicationRecord
  belongs_to :transaction

  with_options presence: true do
    
end

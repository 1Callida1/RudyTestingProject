class Diary < ApplicationRecord
  has_many :notes
  enum kind: {public_type: 0, private_type: 1}
end

class Iclone < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
end

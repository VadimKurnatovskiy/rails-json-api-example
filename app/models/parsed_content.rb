class ParsedContent < ApplicationRecord
  validates :email, presence: true
  validates :url, presence: true
end

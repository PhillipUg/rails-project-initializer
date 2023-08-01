class Download < ApplicationRecord
  validates :app_type, :rails_version, :ruby_version, :database, presence: true
end

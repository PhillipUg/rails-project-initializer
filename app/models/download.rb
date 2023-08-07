class Download < ApplicationRecord
  validates :app_type, :rails_version, :ruby_version, :database, presence: true

  def self.total_count
    count
  end
end

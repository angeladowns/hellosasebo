# config/initializers/carrierwave.rb

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# Use AWS storage if in production
if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
  end

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]
  }
  config.fog_directory  = ENV["S3_BUCKET_NAME"]
end

# Use local storage for development and testing
if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

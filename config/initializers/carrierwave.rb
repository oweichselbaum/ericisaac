CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['S3_KEY_ERIC'],       # required
    :aws_secret_access_key  => ENV['S3_SECRET_ERIC'],       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = "ericisaacsite"                   # required
  config.asset_host       = "http://s3.amazonaws.com/ericisaacsite"            # optional, defaults to nil
  config.fog_public     = true                                 # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

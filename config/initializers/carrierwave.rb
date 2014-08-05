CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIK6LXE4DRUFWJODQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = "ericisaacsite"                   # required
  config.asset_host       = "http://s3.amazonaws.com/ericisaacsite"            # optional, defaults to nil
  config.fog_public     = true                                 # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

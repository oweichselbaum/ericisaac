CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJZ7NRJWGVDOOT7CQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = "ericisaac"                   # required
  config.fog_host       = "http://s3.amazonaws.com/ericisaac"            # optional, defaults to nil
  config.fog_public     = true                                 # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

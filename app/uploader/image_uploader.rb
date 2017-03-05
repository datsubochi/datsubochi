class ImageUploader < CarrierWave::Uploader::Base  

include CarrierWave::RMagick


process :resize_to_limit => [100, 100]


end
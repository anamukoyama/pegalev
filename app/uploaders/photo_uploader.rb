class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :show do
    resize_to_fit 750, 400
  end

  version :index do
    resize_to_fit 350, 350
  end
end

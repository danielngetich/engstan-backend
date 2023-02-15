class ImageUploader < CarrierWave::Uploader::Base
    storage :file
  
    def store_dir
      'public/uploads'
    end
  
    def extension_white_list
      %w(jpg jpeg gif png)
    end
end
  
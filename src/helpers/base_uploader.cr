module BaseUploader
  class UploadException < Exception
  end

  abstract def upload_public_image(file : File): String
end
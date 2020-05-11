require "./base_uploader"

class Uploader
  include BaseUploader

  def upload_public_image(image : File): String
    filename = image.path.split(File::SEPARATOR)[-1]
    if !filename.is_a?(String)
      raise UploadException.new("File is missing name, unable to upload.")
    else
      File.rename(image.path, "#{PUBLIC_IMG_PATH}/#{filename}")

      "/img/#{filename}"
    end
  end

  def upload_public_file(file : File): String
    filename = file.path.split(File::SEPARATOR)[-1]
    if !filename.is_a?(String)
      raise UploadException.new("File is missing name, unable to upload.")
    else
      File.rename(file.path, "#{PUBLIC_UPLOADS_PATH}/#{filename}")

      "/uploads/#{filename}"
    end
  end
end
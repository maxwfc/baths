class UploadsController < ApplicationController
    
    def index
        name = params[:file].original_filename
        directory = "public/images/upload"
        @path = File.join(directory, name)
        File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    end

    private
        def upload_params
          params.require(:upload).permit(:file)
        end

end
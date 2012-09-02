class HomeController < ApplicationController
  def index
  end

  def search
    @zip = ZipCode.find_by_code(params[:search])
    respond_to do |format|
      format.html { }
      format.js do
        render :json => {:html => render_to_string(:partial => 'results.html.erb')}
      end
    end
  end


  def pdf
    @zip = ZipCode.find_by_code(params[:zip_code])
    @zip.generate_pdf
    send_file @zip.pdf_path
  end
end

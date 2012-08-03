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
end

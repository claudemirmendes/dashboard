class ApplicationController < ActionController::Base

  private
    def render_index
      render action: :index
    end
end

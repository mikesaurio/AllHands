class AllhandsController < ApplicationController
  def index

  end

  def show
  	
  end

  def create
	unless params[:key_call].blank?
    
    if Call.where(id_admin: current_user.id, is_active: true).blank?
      Call.create(id_call: params[:key_call],id_admin: current_user.id, is_active: true)
    else
      
    end
		
		render :show
	end
  end

  def validate
  	render :show
  end

  private


end

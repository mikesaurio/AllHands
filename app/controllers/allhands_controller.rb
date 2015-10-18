class AllhandsController < ApplicationController
  before_action :set_user

  def index
    if params[:call]
      validate(params)
    end
  end

  def show
  	
  end

  def create
	unless params[:key_call].blank?
    call = Call.where(id_admin: current_user.id, is_active: true)
    if call.blank?
      call_id = Call.create(id_call: params[:key_call],id_admin: current_user.id, is_active: true)
    else
      call_id = call.last
    end
    redirect_to allhand_path(call_id.id), notice: 'Bienvenido al AllHands.'
	end
  end

  def validate(params)
      call_key = params[:call][:key]
      call = Call.where(id_call: call_key, is_active: true)
      unless call.blank?
        redirect_to allhand_path(call.last.id), notice: 'Bienvenido al AllHands.'
      else
        redirect_to allhands_path, error: 'No existe ninguna llamada con este ID.'
      end
  end

  private 
  def set_user
    @current_user = current_user || nil
  end


end

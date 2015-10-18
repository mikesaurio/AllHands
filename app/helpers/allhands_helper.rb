module AllhandsHelper
	
  def create_key
    unless Call.where(id_admin: current_user.id, is_active: true).blank?
      Call.where(id_call: params[:key_call],id_admin: current_user.id, is_active: true).last
    else
    	(0...25).map { (65 + rand(26)).chr }.join
    end
  end

end

module AllhandsHelper
	
  def create_key(current_user_id)
    unless Call.where(id_admin: current_user_id, is_active: true).blank?
      Call.where(id_admin: current_user_id, is_active: true).last.id_call
    else
    	(0...25).map { (65 + rand(26)).chr }.join
    end
  end

end

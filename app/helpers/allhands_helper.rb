module AllhandsHelper
	def create_key
    (0...10).map { (65 + rand(26)).chr }.join
  end
end

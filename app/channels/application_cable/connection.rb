module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      puts "ON RENTRE DANS la methode CONNECT"
      self.current_user = find_verified_user
      # logger.add_tags 'ActionCable', current_user.email
    end

    private

    def find_verified_user
      puts "ON RENTRE DANS la methode find_verified_user"
      # if verified_user = User.find_by(id: cookies.encrypted[:user_id])
      if current_user = env['warden'].user
        puts "ATTENTION app/channels/applicationCable/connections C'EST TOUT BON"
        current_user
      else
        puts "ATTENTION app/channels/applicationCable/connections C'EST PAS BON"
        reject_unauthorized_connection
      end
    end
  end
end

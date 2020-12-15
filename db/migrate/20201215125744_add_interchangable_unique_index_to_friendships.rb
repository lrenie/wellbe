class AddInterchangableUniqueIndexToFriendships < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
          connection.execute(%q(
              create unique index index_friendships_on_interchangable_sender_id_and_recipient_id on friendships(greatest(sender_id,recipient_id), least(sender_id,recipient_id));
              create unique index index_friendships_on_interchangable_recipient_id_and_sender_id on friendships(least(sender_id,recipient_id), greatest(sender_id,recipient_id));
          ))
      end

      dir.down do
          connection.execute(%q(
              drop index index_requests_on_interchangable_sender_id_and_recipient_id;
              drop index index_requests_on_interchangable_recipient_id_and_sender_id;
          ))
      end    
    end
  end
end

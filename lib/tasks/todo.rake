namespace :todo do
  desc "Delete items older than five days"
  task delete_items: :environment do
  	Item.where("created_at <= ?", Time.now - 5.days).destroy_all
  end

end

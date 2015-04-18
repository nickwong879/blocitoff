class Item < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  default_scope { order('updated_at DESC') }
  
  def due_date
  	
  end

  def days_left

  	(DateTime.now.to_date - created_at.to_date).to_i

  end


end

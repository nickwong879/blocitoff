class Item < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  default_scope { order('updated_at DESC') }
  


  def days_left

  	(due_date.to_date - DateTime.now.to_date).to_i

  end


end

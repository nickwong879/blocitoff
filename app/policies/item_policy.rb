class ItemPolicy < ApplicationPolicy

	def destroy?
		user.present? && (record.user == user || user.admin?)
	end

end
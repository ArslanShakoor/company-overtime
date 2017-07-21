class AuditLog < ApplicationRecord
	paginates_per 5
	enum status: { pending: 0, approved: 1}
  belongs_to :user

  validates_presence_of :start_date, :status 

  after_initialize :set_defaults
  before_update :set_end_date,  if: :approved?

  private
    def set_defaults
    	self.start_date ||= Date.today - 6.days
    end	

    def set_end_date
      self.end_date = Date.today
    end
end

class Post < ApplicationRecord
	paginates_per 5
	enum status: {submitted: 0, approved: 1, rejected: 2}
	belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0}
  scope :posts_by, ->(user){ where(user_id: user.id)}

  after_save :approve_audit_log , if: :submitted?
  after_save :unapprove_audit_log , if: :rejected?

  private
    def approve_audit_log
			audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
			audit_log.approved! if audit_log
		end
		def unapprove_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
			audit_log.pending! if audit_log
		end
end

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
	before do 
    @audit_log = FactoryGirl.create(:audit_log)
	end	
  describe "creation" do
    it "can properly created" do
     	expect(@audit_log).to be_valid
    end	

    it "should always have user_association" do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid    
    end
    
    it "should always have start_date" do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it "should always have status" do
    	@audit_log.status = nil
    	expect(@audit_log).to_not be_valid

    end

    it "shoudl have start date 6 weeks prior" do
     audit_log_check= AuditLog.create(user_id: User.last.id)
     expect(audit_log_check.start_date).to eq(Date.today - 6.days)
    end
  end	
end

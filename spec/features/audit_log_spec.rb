require 'rails_helper'

describe "audit logs" do
  before  do
    @user = FactoryGirl.create(:admin_user)
    login_as(@user)
  end   

  describe "index can reached by admin" do 
    it "has index path which be reach" do
      visit audit_logs_path
      expect(page).to have_content(/Audit Logs/) 
    end 
    it "cannot be reached with non admin" do 
      @user = FactoryGirl.create(:user)
      login_as(@user)
      visit audit_logs_path
      expect(page).to_not have_content(/Audit Logs/)
    end  
  end	
end  
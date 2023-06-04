require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  describe 'relationships' do
    it { should have_many :campaign_users }
    it { should have_many(:campaigns).through(:campaign_users)}
  end
end
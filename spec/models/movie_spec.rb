require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Association' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:url) }
  end
end

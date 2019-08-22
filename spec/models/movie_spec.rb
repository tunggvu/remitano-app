require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Association' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { should allow_value('https://www.youtube.com/watch?v=djWKg75SNtw').for(:url) }
    it { should_not allow_value('https://www.youtube.com/djWKg75SNtw').for(:url) }
  end
end

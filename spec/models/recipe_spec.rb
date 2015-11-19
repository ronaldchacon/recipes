require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) { @user = FactoryGirl.create(:user) }

  it 'should be valid' do
    recipe = Recipe.new(name: "Chicken Alfredo", user: @user)
    expect(recipe).to be_valid
  end

  it 'should not be valid' do
    recipe = Recipe.new(name: nil, user: nil)
    expect(recipe).to be_invalid
  end

  it { should accept_nested_attributes_for(:directions) }
  it { should accept_nested_attributes_for(:ingredients) }
end

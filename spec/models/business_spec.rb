require 'spec_helper'

describe Business do
  before(:all) do
    @business = Business.new
  end

  it { should have_many(:bartenders) }
  it { should have_and_belong_to_many(:users) }
end
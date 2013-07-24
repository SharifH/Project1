require 'spec_helper'

describe Business do
  before(:all) do
    @business = Business.new
  end

  it { should have_many(:bartenders) }
  it { should have_many(:users) }
end
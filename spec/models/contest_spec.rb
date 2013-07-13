require 'spec_helper'

describe Contest do
  before(:all) do
    @Contest = Contest.new
  end

  it { should have_and_belong_to_many(:users) }
  it { should have_many(:prizes)}
end
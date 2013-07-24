require 'spec_helper'

describe Contest do
  before(:all) do
    @Contest = Contest.new
  end

  it { should have_many(:users) }
  it { should have_many(:prizes)}
end
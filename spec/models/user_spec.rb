require 'spec_helper'

describe User do
  before(:all) do
    @User = User.new
  end

  it { should have_and_belong_to_many(:businesses) }
  it { should have_and_belong_to_many(:contests) }
end
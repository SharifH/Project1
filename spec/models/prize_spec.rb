require 'spec_helper'

describe Prize do
  before(:all) do
    @prize = Prize.new
  end

  it { should belong_to(:contest) }
  it { should have_and_belong_to_many(:users) }
end
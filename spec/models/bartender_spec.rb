require 'spec_helper'

describe Bartender do
  before(:all) do
    @bartender = Bartender.new
  end

  it { should belong_to(:business) }

end
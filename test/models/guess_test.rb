require "test_helper"

describe Guess do
  let(:guess) { Guess.new }

  it "must be valid" do
    value(guess).must_be :valid?
  end
end

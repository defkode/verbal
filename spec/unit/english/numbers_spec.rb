require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe Verbal::English::Numbers do
  it 'should return correct string' do
    Verbal::English::Numbers.to_words(9).should     == "nine"
    Verbal::English::Numbers.to_words(109).should   == "one hundred nine"
    Verbal::English::Numbers.to_words(34).should    == "thirty-four"
    Verbal::English::Numbers.to_words(2_001).should == "two thousand and one"
    Verbal::English::Numbers.to_words(1_134).should == "one thousand one hundred and thirty-four"
  end
end
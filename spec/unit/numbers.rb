require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Verbal::Polish::Numbers do

  it 'should return correct string' do
    Verbal::Polish::Numbers.to_words(0).should      == 'zero'
    Verbal::Polish::Numbers.to_words(101).should    == 'sto jeden'
    Verbal::Polish::Numbers.to_words(15).should     == 'piętnaście'
    Verbal::Polish::Numbers.to_words(21).should     == 'dwadzieścia jeden'
    Verbal::Polish::Numbers.to_words(1_592).should  == 'tysiąc pięćset dziewięćdziesiąt dwa'
    Verbal::Polish::Numbers.to_words(1_000).should  == 'tysiąc'
  end

  it 'should variate strings depending on grammatical gender' do
    Verbal::Polish::Numbers.to_words(1, 0).should     == 'jeden'
    Verbal::Polish::Numbers.to_words(1, 1).should     == 'jedna'
    Verbal::Polish::Numbers.to_words(1, 2).should     == 'jedno'
    Verbal::Polish::Numbers.to_words(2, 0).should     == 'dwa'
    Verbal::Polish::Numbers.to_words(2, 1).should     == 'dwie'
    Verbal::Polish::Numbers.to_words(2, 2).should     == 'dwa'
    Verbal::Polish::Numbers.to_words(101, 0).should   == 'sto jeden'
    Verbal::Polish::Numbers.to_words(101, 1).should   == 'sto jeden'
    Verbal::Polish::Numbers.to_words(102, 0).should   == 'sto dwa'
    Verbal::Polish::Numbers.to_words(102, 1).should   == 'sto dwie'
    Verbal::Polish::Numbers.to_words(1_001, 0).should == 'tysiąc jeden'
    Verbal::Polish::Numbers.to_words(1_001, 1).should == 'tysiąc jeden'
    Verbal::Polish::Numbers.to_words(1_002, 0).should == 'tysiąc dwa'
    Verbal::Polish::Numbers.to_words(1_002, 1).should == 'tysiąc dwie'
  end

end


describe Verbal::English::Numbers do

  it 'should return correct string' do
    Verbal::English::Numbers.to_words(34).should     == "thirty-four"
    Verbal::English::Numbers.to_words(2_001).should  == "two thousand and one"
    Verbal::English::Numbers.to_words(1_134).should  == "one thousand one hundred and thirty-four"
  end

end

require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe Verbal::German::Numbers do

  it 'should return correct string for numbers < 20' do
    Verbal::German::Numbers.to_words(0).should      == 'null'
    Verbal::German::Numbers.to_words(15).should     == 'fünfzehn'
  end

  it 'should return correct string for numbers < 100' do
    Verbal::German::Numbers.to_words(21).should     == 'einundzwanzig'
    Verbal::German::Numbers.to_words(32).should     == 'zweiunddreißig'
    Verbal::German::Numbers.to_words(54).should     == 'vierundfünfzig'
    Verbal::German::Numbers.to_words(78).should     == 'achtundsiebzig'
    Verbal::German::Numbers.to_words(99).should     == 'neunundneunzig'
  end

  it 'should return correct string for numbers < 1000' do
    Verbal::German::Numbers.to_words(101).should    == 'einhunderteins'
    Verbal::German::Numbers.to_words(413).should    == 'vierhundertdreizehn'
  end

  it 'should return correct string for numbers < 100_000' do
    Verbal::German::Numbers.to_words(1_000).should  == 'eintausend'
    Verbal::German::Numbers.to_words(1_592).should  == 'eintausendfünfhundertzweiundneunzig'
  end

end

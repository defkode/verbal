require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Verbal::Currency do

  it 'should return correct string' do
    Verbal::Polish::Currency.to_words(0).should                   == 'zero złotych zero groszy'
    Verbal::Polish::Currency.to_words(0, 'PLN').should            == 'zero złotych zero groszy'
    Verbal::Polish::Currency.to_words(2_01, 'CZK').should         == 'dwie korony czeskie jeden halerz'
    Verbal::Polish::Currency.to_words(1_000_001_00, 'CZK').should == 'milion jeden koron czeskich zero halerzy'
    Verbal::Polish::Currency.to_words(1_05, 'EUR').should         == 'jedno euro pięć eurocentów'
    Verbal::Polish::Currency.to_words(500_02, 'RUB').should       == 'pięćset rubli dwie kopiejki'
  end

end

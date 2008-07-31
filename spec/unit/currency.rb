require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Verbal::Currency do

  it 'should return correct string' do
    Verbal::Currency.to_words(0).should == 'zero złotych zero groszy'
    Verbal::Currency.to_words(0, 'PLN').should == 'zero złotych zero groszy'
    Verbal::Currency.to_words(2_01, 'CZK').should == 'dwie korony czeskie jeden halerz'
    # TODO: neuter gender to be supported in verbal-0.3
    Verbal::Currency.to_words(1_05, 'EUR').should == 'jedno euro pięć eurocentów'
  end

end

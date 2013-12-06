require_relative "../binary_clock"

describe Clock do
  let(:clock) { Clock.new }

  {
    0 => '0000',
    1 => '0001',
    2 => '0010',
    3 => '0011',
    4 => '0100',
    5 => '0101',
    6 => '0110',
    7 => '0111',
    8 => '1000',
    9 => '1001',
  }.each_pair do |base_ten, binary| 
    it "converts #{base_ten} to #{binary}" do
      clock.convert(base_ten).should == binary
    end
  end

  #to pass this test uncoment time_only vairable in convert_time method: TODO: fix it!
  it "converts time to binary representation" do
    clock.in_binary(Time.now).should == "000100000000000101011001"
  end
end



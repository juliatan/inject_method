require 'blocks'

describe Array do

	before do
		@test_array = []
		@test_array << 1 << 2 << 5 << 3 << 7
	end

	it 'map iterates through the array, passing each one into a block' do
		result = @test_array.map2 { |num| num*2 }
		expect(result).to eq [2,4,10,6,14]
	end

	it 'map using proc call is computered correctly' do
		map2_proc = Proc.new {|num| num + 2}
		result = @test_array.map2(&map2_proc)
		expect(result).to eq [3,4,7,5,9]
	end

	it 'select iterates through the array, selecting the elements that pass the block criteria' do
		result = @test_array.select2 { |num| num <= 4 }
		expect(result).to eq [1,2,3]
	end

	it 'each iterates through the array, passing each one into the block but does not return any values' do
		result = @test_array.each2 { |num| num*2 }
		expect(result).to eq @test_array
	end

	it 'reduce collects the array into one single number' do
		result = @test_array.reduce2 { |acc, num| acc+num }
		expect(result).to eq 18
	end

end

describe 'Inject' do

  let(:arr) { [1,2,3,4] }
  let(:smaller_arr) { [1,2,3] }
  let(:add_block) {Proc.new {|result,el| result + el}}
  let(:subtract_block) {Proc.new {|result,el| result - el}}
  let(:multiply_block) {Proc.new {|result,el| result * el}}


  it 'sums all elements of array' do
    expect(arr.reduce2(&add_block)).to eq arr.inject(&add_block)
  end

  it 'substracts all elements of array via yield approach' do
    expect(arr.reduce2(&subtract_block)).to eq arr.inject(&subtract_block)
  end 

  it 'substracts elements of array with starting value of 5' do
    expect(arr.reduce2(5, &subtract_block)).to eq arr.inject(5, &subtract_block)
  end

  it 'multiplies all elements of array' do
    expect(smaller_arr.reduce2(&multiply_block)).to eq smaller_arr.inject(&multiply_block)
  end

  it 'multiplies all elements of array starting with 5' do
    expect(smaller_arr.reduce2(6, &multiply_block)).to eq smaller_arr.inject(6, &multiply_block)
  end

  it 'takes a symbol' do
  	expect(smaller_arr.reduce2(:*)).to eq smaller_arr.inject(:*)
  end

end
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
# missing_number_spec.rb

# Suppose you have an array of 99 numbers. The array contains the digits 1 to 100 with one digit missing. 
# Write four different algorithms to compute the missing number. 
# Two of these should optimize for low storage and two of these should optimize for fast processing.

require 'rspec'

def missing_number params
  sum_total = 5050
  params_total = params.reduce(:+)
  sum_total - params_total
end

def missing_number_second params
  # this method will only find missing numbers between the first and last numbers in the array.
  # it will not pass edge cases, e.g. missing 1 or 100.
  params.sort!
  result = nil

  params.each_with_index do |number, index| 
    if number != index + 1
      result = index + 1
      break
    end 
  end
  result
end

def missing_number_third params
  (1..100).each do |number|
    return number unless params.include?(number)
  end
  return nil
end

def missing_number_fourth params
  # this method will only find missing numbers between the first and last numbers in the array.
  # it will not pass edge cases, e.g. missing 1 or 100.
  params.sort!
  eval_num = 1
  params.each do |number| 
    if eval_num == number
      eval_num = number + 1
    else
      return eval_num
    end
  end
  return nil
end

describe 'Missing Number' do 

  let(:missing_11)   { [*(1..10), *(12..100)] }
  let(:missing_68)   { [*(1..67), *(69..100)] }
  let(:missing_100)  { [*1..99] }
  let(:missing_none) { [*1..100] }

  describe '#missing_number' do

    it 'takes an array missing number 11 and returns 11' do
      expect(missing_number(missing_11)).to eq(11)
    end

    it 'takes an array missing number 68 and returns 68' do
      expect(missing_number(missing_68)).to eq(68)
    end

    it 'takes an array missing number 100 and returns 100' do
      expect(missing_number(missing_100)).to eq(100)
    end
    
    it 'takes an array missing no numbers and returns nil' do
      expect(missing_number(missing_none)).to eq(0)
    end
  end

  describe '#missing_number_second' do

    it 'takes an array missing number 11 and returns 11' do
      expect(missing_number_second(missing_11)).to be(11)
    end

    it 'takes an array missing number 68 and returns 68' do
      expect(missing_number_second(missing_68)).to be(68)
    end

    it 'takes an array missing number 100 and returns nil' do
      expect(missing_number_second(missing_100)).to be(nil)
    end
    
    it 'takes an array missing no numbers and returns nil' do
      expect(missing_number_second(missing_none)).to be(nil)
    end
  end

  describe '#missing_number_third' do

    it 'takes an array missing number 11 and returns 11' do
      expect(missing_number_third(missing_11)).to be(11)
    end

    it 'takes an array missing number 68 and returns 68' do
      expect(missing_number_third(missing_68)).to be(68)
    end

    it 'takes an array missing number 100 and returns 100' do
      expect(missing_number_third(missing_100)).to be(100)
    end
    
    it 'takes an array missing no numbers and returns nil' do
      expect(missing_number_third(missing_none)).to be(nil)
    end
  end

  describe '#missing_number_fourth' do

    it 'takes an array missing number 11 and returns 11' do
      expect(missing_number_fourth(missing_11)).to be(11)
    end

    it 'takes an array missing number 68 and returns 68' do
      expect(missing_number_fourth(missing_68)).to be(68)
    end

    it 'takes an array missing number 100 and returns nil' do
      expect(missing_number_fourth(missing_100)).to be(nil)
    end
    
    it 'takes an array missing no numbers and returns nil' do
      expect(missing_number_fourth(missing_none)).to be(nil)
    end

  end
end
# frozen_string_literal: true

require '../../utils/file_reader.rb'

class UnknownOperator < StandardError
end

class Part1
  def calculate_program
    @input = FileReader.read_integers('../input.txt')
    @input[1] = 12
    @input[2] = 2
    @input.each_slice(4) do |input_batch|
      op_code = input_batch[0].to_i
      if op_code == 99
        return @input
      else
        position1 = input_batch[1].to_i
        operator1 = @input[position1].to_i
        position2 = input_batch[2].to_i
        operator2 = @input[position2].to_i
        result = calculate_result(operator1, operator2, op_code)
        to_index = input_batch[3].to_i
        @input[to_index] = result
      end
    end
    @input
  end

  def calculate_result(op1, op2, op)
    if op == 1
      op1 + op2
    elsif op == 2
      op1 * op2
    else
      raise UnknownOperator
    end
  end
end

p = Part1.new
result = p.calculate_program
puts "End Result #{result[0]}"
puts "Result #{result}"

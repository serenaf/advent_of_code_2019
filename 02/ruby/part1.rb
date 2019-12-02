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
      return @input if op_code == 99

      operand1 = determine_operand(1, input_batch)
      operand2 = determine_operand(2, input_batch)
      result = calculate_result(operand1, operand2, op_code)
      to_index = input_batch[3].to_i
      @input[to_index] = result
    end
    @input
  end

  def determine_operand(index, input_batch)
    position = input_batch[index].to_i
    @input[position].to_i
  end

  def calculate_result(op1, op2, op_code)
    if op_code == 1
      op1 + op2
    elsif op_code == 2
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

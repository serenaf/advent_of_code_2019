# frozen_string_literal: true

require '../../utils/file_reader.rb'

class UnknownOperator < StandardError
end

class Part2
  def determine_noun_and_verb
    noun = 0
    while noun <= 99
      verb = 0
      while verb <= 99
        result = calculate_program(noun, verb)
        return [noun, verb] if result[0] == 19_690_720

        verb += 1
      end
      noun += 1
    end
  end

  def calculate_program(noun, verb)
    memory = FileReader.read_integers('../input.txt')
    memory[1] = noun
    memory[2] = verb
    memory.each_slice(4) do |input_batch|
      op_code = input_batch[0].to_i
      return memory if op_code == 99

      operand1 = determine_operand(1, input_batch, memory)
      operand2 = determine_operand(2, input_batch, memory)
      result = calculate_result(operand1, operand2, op_code)
      to_index = input_batch[3].to_i
      memory[to_index] = result
    end
    memory
  end

  def determine_operand(index, input_batch, memory)
    position = input_batch[index].to_i
    memory[position].to_i
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

p = Part2.new
result = p.determine_noun_and_verb
puts "noun #{result[0]}"
puts "verb #{result[1]}"

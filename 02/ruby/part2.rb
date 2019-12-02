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
        puts "result 0 #{result[0]}"
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
      if op_code == 99
        return memory
      else
        position1 = input_batch[1].to_i
        operator1 = memory[position1].to_i
        position2 = input_batch[2].to_i
        operator2 = memory[position2].to_i
        result = calculate_result(operator1, operator2, op_code)
        to_index = input_batch[3].to_i
        memory[to_index] = result
      end
    end
    memory
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

p = Part2.new
puts 'here'
result = p.determine_noun_and_verb
puts "noun #{result[0]}"
puts "verb #{result[1]}"

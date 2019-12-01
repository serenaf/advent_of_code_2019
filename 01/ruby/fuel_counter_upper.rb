# frozen_string_literal: true

require '../../utils/file_reader.rb'

class FuelCounterUpper
  def calculate_fuel
    @fuel_sum = 0
    @input = FileReader.read_from_file('../input.txt')
    @input.each do |i|
      @fuel_sum += calculate_for_mass(i.to_i, 0)
    end
    puts "end result is #{@fuel_sum}"
  end

  private

  def calculate_for_mass(mass, final_fuel)
    result = mass / 3 - 2
    return final_fuel if result <= 0

    final_fuel += result
    calculate_for_mass(result, final_fuel)
  end
end

fcu = FuelCounterUpper.new
fcu.calculate_fuel

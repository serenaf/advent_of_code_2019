# frozen_string_literal: true

class SecureContainer
  def find_all_passwords(range_start, range_end)
    meeting_criteria = 0
    (range_start..range_end).each do |n|
      input = n.digits.reverse
      meeting_criteria += 1 if meets_criteria?(n.digits.reverse)
    end
    meeting_criteria
  end

  def find_all_passwords_part2(range_start, range_end)
    meeting_criteria = 0
    (range_start..range_end).each do |n|
      input = n.digits.reverse
      meeting_criteria += 1 if meets_criteria_part2?(n.digits.reverse)
    end
    meeting_criteria
  end

  def meets_criteria?(input)
    has_same_adjacent_numbers?(input) && has_all_increasing_numbers?(input)
  end

  def meets_criteria_part2?(input)
    has_same_adjacent_numbers_inside_matching_group?(input) && has_all_increasing_numbers?(input)
  end

  def has_same_adjacent_numbers?(input)
    input.each_cons(2) do |batch|
      return true if batch[0] == batch[1]
    end
    false
  end

  def has_same_adjacent_numbers_inside_matching_group?(input)
    matching_group = {}
    input.each do |i|
      matching_group[i] = if matching_group[i]
                            matching_group[i] + 1
                          else
                            1
                          end
    end
    matching_group.values.any? { |v| v == 2 }
  end

  def has_all_increasing_numbers?(input)
    return false if input.each_cons(2).any? { |a, b| a > b }

    true
  end
end

p = SecureContainer.new
puts p.find_all_passwords(402_328, 864_247)
puts p.find_all_passwords_part2(402_328, 864_247)

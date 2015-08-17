require_relative '../test_config'
require_relative '../../domain/values/instruction'

class InstructionTest < JustJobTest
  def test_can_be_initialized_with_a_valid_string
    assert_silent do
      Instruction.new "Open the pod bay doors"
    end
  end

  def test_has_same_string_value_as_raw_value
    instruction = Instruction.new "Open the pod bay doors"
    assert_equal "Open the pod bay doors", instruction.to_s
  end

  def test_cannot_be_created_with_less_than_2_charachters
    assert_raises ArgumentError do
      Instruction.new "a"
    end
  end

  def test_cannot_be_created_with_more_than_255_charachters
    assert_raises ArgumentError do
      Instruction.new "a" * 256
    end
  end

  def test_cannot_contain_angled_brackets
    assert_raises ArgumentError do
      Instruction.new "<bad behaviour>"
    end
  end
end

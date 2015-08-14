require_relative '../test_config'
require_relative '../../domain/values/instruction'

class InstructionTest < JustJobTest
  def test_can_be_initialized_with_a_valid_string
    assert_silent do
      Instruction.new "Open the pod bay doors"
    end
  end
end

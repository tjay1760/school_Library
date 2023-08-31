require './basedecorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    return name[0, 10] if name.length > 10

    name
  end
end

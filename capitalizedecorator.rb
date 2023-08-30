require './basedecorator'
class CapitalizeDecorator < BaseDecorator
    def correct_name(name)
        @nameable.correct_name.capitalize
    end
end
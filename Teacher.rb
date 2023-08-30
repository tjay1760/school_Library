require './Person'
class Teacher < Person
    def initialize(specialization, age, name = 'unknown', parent_permmission: true)
        super(age, name, parent_permmission)
        @specialization = specialization
    end
    def can_use_services?
        true
    end
end
Emma = Teacher.new("MATH", 43,"emma")

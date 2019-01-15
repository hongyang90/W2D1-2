class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee
  attr_writer :employees_arr
  
  def initialize(name, title, salary, boss)
    super
    @employees_arr = []
  end

  def bonus(multiplier)
    bonus = 0
    @employees_arr.each do |person|
      bonus += person.salary
    end

    bonus * multiplier
  end
end

ned = Manager.new('Ned', 'Founder', 1000000, nil )
darren = Manager.new('Darren', 'TA Manager', 78000, ned )
shawna = Employee.new('Shawna', 'TA', 12000, darren )
david = Employee.new('David', 'TA', 10000, darren )

ned.employees_arr = [darren, shawna, david]
darren.employees_arr = [shawna, david]

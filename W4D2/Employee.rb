class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss = nil)
        @name = name.capitalize
        @title = title
        @salary = salary
        @boss = boss
        boss.add_employees(self) if !boss.nil?
    end

    def bonus(multiplier)
        salary * multiplier
    end
end


class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def add_employees(employee)
        @employees << employee
    end

    def bonus(multiplier)
        total_salary * multiplier
    end

    def total_salary
        total_salary = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary + employee.total_salary
            else 
                total_salary += employee.salary
            end
        end
        total_salary
    end
end

ned = Manager.new('ned', 'Founder', 1000000)
darren = Manager.new('darren', 'TA Manager', 78000, ned)
david = Employee.new('david', 'TA', 10000, darren)
shawna = Employee.new('shawna', 'TA', 12000, darren)


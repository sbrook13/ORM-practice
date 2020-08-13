class Teacher
    attr_reader :first_name, :last_name, :id

    def initialize first_name, last_name, id=nil
        @first_name = first_name
        @last_name = last_name
        @id = id
    end

    def save
        sql = <<-SQL
            INSERT INTO teachers (
                first_name, 
                last_name
            ) VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, first_name, last_name)
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS teachers (
                id INTEGER PRIMARY KEY,
                first_name TEXT,
                last_name TEXT
            )
        SQL
        DB[:conn].execute(sql)
    end

    def self.all
        sql = <<-SQL
            SELECT * FROM teachers
        SQL
        teachers = DB[:conn].execute(sql)
        teachers.map do |teacher|
            Teacher.new teacher[1], teacher[2], teacher[0]
        end
    end
end
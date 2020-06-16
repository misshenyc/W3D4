require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      select
        "#{table_name}".*
      from
        "#{table_name}"
      limit 0
    SQL
    @columns = cols.map!(&:to_sym)
  end

  def self.finalize!
    columns.each do |k|
      define_method("#{k}") do 
        self.attributes[k]
      end

      define_method("#{k}=") do |v|
        self.attributes[k] = v
      end
    end

  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.name.pluralize.downcase
  end

  def self.all
    # ...
    results =DBConnection.execute(<<-SQL)
      select
        "#{table_name}".*
      from
        "#{table_name}"
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end

  end

  def self.find(id)
    # ...
    result =DBConnection.execute(<<-SQL, id)
      select
        "#{table_name}".*
      from
        "#{table_name}"
      where
        "#{table_name}".id = ?
    SQL
    return nil if result.nil? 
    self.new(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |k,v| 
      raise "unknown attribute '#{k}'" if !self.class.columns.include?(k)
      self.send("#{k}=", v)
    end

  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
    self.class.columns.map{|k| self.send(k)}
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

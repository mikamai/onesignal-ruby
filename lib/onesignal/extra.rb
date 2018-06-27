# frozen_string_literal: true

class Class
  def auto_attr_reader *readers
    readers.each do |r|
      define_method r do
        @attributes[r]
      end
    end
  end

  def auto_attr_writer *writers
    writers.each do |w|
      define_method "#{w}=" do |val|
        @attributes[w] = val
      end
    end
  end

  def auto_attr_accessor *accessors
    auto_attr_reader accessors
    auto_attr_writer accessors
  end
end

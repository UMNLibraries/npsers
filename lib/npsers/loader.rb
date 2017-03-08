require 'csv'

# Greedy - load everything into memory, sort it, write it
module NPSERS
  class Loader
    attr_reader :extract_by_letter_klass, :file_klass, :filepath
    def initialize(extract_by_letter_klass: ExtractByLetter,
                   file_klass: File,
                   filepath: './data.csv')
      @extract_by_letter_klass = extract_by_letter_klass
      @file_klass              = file_klass
      @filepath                = filepath
    end

    def load
      file_klass.open(filepath, 'w') do |file|
        file.write(to_csv)
      end
    end

    # Decided at the last minute to produce a CSV file rather than a JSON file
    # and I don't have time to refactor JSON out of the extractor stuff
    def to_csv
      CSV.generate do |csv|
        sorted_by_name.map  do |item|
          csv << [item[:name], item[:email], item[:phone]].flatten
        end
      end
    end

    def sorted_by_name
      extraction.uniq.sort { |a,b| a[:name].downcase <=> b[:name].downcase }
    end

    def extraction
      extract_by_letter_klass.new.extract
    end
  end
end
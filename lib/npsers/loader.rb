require 'json'

module NPSERS
  class Loader
    attr_reader :extract_by_letter_klass, :file_klass, :filepath
    def initialize(extract_by_letter_klass: ExtractByLetter,
                   file_klass: File,
                   filepath: './data.json')
      @extract_by_letter_klass = extract_by_letter_klass
      @file_klass              = file_klass
      @filepath                = filepath
    end

    def load
      file_klass.open(filepath, 'w') do |file|
        file.write(extract_by_letter_klass.new.extract.to_json)
      end
    end
  end
end
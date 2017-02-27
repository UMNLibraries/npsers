require 'json'

module NPSERS
  class Loader
    attr_reader :extract_by_letter_klass, :file_klass
    def initialize(extract_by_letter_klass: ExtractByLetter,
                   file_klass: File)
      @extract_by_letter_klass = extract_by_letter_klass
      @file_klass              = file_klass
    end

    def load
      file_klass.open('./data.json', 'w') do |file|
        file.write(extract_by_letter_klass.new.extract.to_json)
      end
    end
  end
end
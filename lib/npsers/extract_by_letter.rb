module NPSERS
  class ExtractByLetter
    attr_reader :extract_by_page_klass
    def initialize(extract_by_page_klass: ExtractByPage)
      @extract_by_page_klass = extract_by_page_klass
    end

    def extract
      letters.map do |letter|
        puts "Extracting Letter: #{letter}"
        extract_by_page_klass.new(letter: letter).extract
      end.flatten
    end

    def letters
      ('a'..'z').to_a
    end

  end
end
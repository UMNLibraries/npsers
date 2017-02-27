module NPSERS

  class BatchURL
    attr_reader :base_url, :letter, :page_number

    def initialize(base_url: 'https://www.nps.gov/directory/employees.cfm',
                   letter: 'a',
                   page_number: 1)
      @base_url     = base_url
      @page_number  = page_number.to_i
      @letter       = letter
    end

    def url
      "#{base_url}?StartRow=#{row}&sn=#{letter}*"
    end

    private

    def row
      (page_number == 1) ? 1 : (page_number - 1) *  50 + 1
    end

  end

end
module NPSERS
  class ExtractByPage
    attr_reader :page_klass, :batch_url_klass, :letter
    def initialize(page_klass: Page, batch_url_klass: BatchURL, letter: 'a')
      @page_klass      = page_klass
      @batch_url_klass = batch_url_klass
      @letter          = letter
    end

    def extract
      first_page[:pages].map do |page_number|
         puts "Extracting Page: #{page_number}"
         page(page_number)
      end
    end

    def first_page
      page(1)
    end

    def page(page_number)
      puts "page_number: #{page_number} URL: #{url(page_number)}"
      page_klass.new(url: url(page_number)).result
    end

    def url(page_number)
      batch_url_klass.new(letter: letter, page_number: page_number).url
    end
    end
end
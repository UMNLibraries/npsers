require 'nokogiri'
require 'open-uri'

module NPSERS

  class Page
    attr_reader :url

    def initialize(url: '')
      @url = url
    end

    def result
      {pages: pages, data: data}
    end

    private

    def pages
      page.xpath('//table/tr/td/table[2]/tr/td[1]').map do |el|
        el.text.gsub(/\t/,'').split("\r")
      end
      .flatten
      .map {|item| item.gsub(/\s/, '') }
      .select { |item| !invalid_results.include? item }
      .map { |item| item.to_i }
    end

    def name(element)
      strip(element.xpath('./td[1]').text)
    end

    def email(element)
      strip(element.xpath('./td[2]').text)
    end

    def phone(element)
      strip(element.xpath('./td[3]').text)
    end

    def data
      page.xpath('//table/tr/td/table[3]/tr').map do |el|
        [:name, :email, :phone].inject({}) do |memo, item|
          if valid?(call(item, el))
            memo.merge("#{item}": call(item, el))
          else
            memo
          end
        end
      end.select { |item| item != {} }
    end

    def call(method, element)
      self.send(method, element)
    end

    def valid?(text)
      !invalid_results.include? text
    end

    def invalid_results
      ['E M A I L', 'N A M E', 'PHONE NUMBER', 'Page', '']
    end

    def page
      @page ||= Nokogiri::HTML(open(url))
    end

    def strip(text)
      text.gsub(/\t|\r|\n/,'').gsub(/\s$/,'')
    end
  end
end
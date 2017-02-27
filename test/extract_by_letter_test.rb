require 'test_helper'

module NPSERS
  describe Page do
    let(:extract_by_page_klass) { Minitest::Mock.new }
    let(:extract_by_page_object) { Minitest::Mock.new }
    it 'finds a result set' do
      ('a'..'z').map do |letter|
        extract_by_page_klass.expect :new, extract_by_page_object, [{letter: letter}]
        extract_by_page_object.expect :extract, [{foo: 'bar'}]
      end
      ExtractByLetter.new(extract_by_page_klass: extract_by_page_klass).extract.must_equal [{:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}, {:foo=>"bar"}]
    end
  end
end
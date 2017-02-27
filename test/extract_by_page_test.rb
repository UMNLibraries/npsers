require 'test_helper'

module NPSERS
  describe Page do
    let(:batch_url_klass) { Minitest::Mock.new }
    let(:batch_url_object) { Minitest::Mock.new }
    let(:page_klass) { Minitest::Mock.new }
    let(:page_object) { Minitest::Mock.new }
    it 'finds a result set' do
      batch_url_klass.expect :new, batch_url_object, [{letter: 'a', page_number: 1}]
      batch_url_object.expect :url, 'http://example.com'
      page_klass.expect :new, page_object, [{url: 'http://example.com'}]
      page_object.expect :result, {pages: [1,2], data: 'blah'}
      ExtractByPage.new(batch_url_klass: batch_url_klass,
                        page_klass: page_klass).first_page.must_equal ({pages: [1,2], data: 'blah'})
    end
  end
end
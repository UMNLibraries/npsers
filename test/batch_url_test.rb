require 'test_helper'

module NPSERS
  describe BatchURL do
    let(:batch_url) do
      BatchURL.new(base_url: 'https://www.nps.gov/directory/employees.cfm',
                   page_number: 3,
                   letter: 'z')
    end

    it 'increments a URL' do
      batch_url.url.must_equal 'https://www.nps.gov/directory/employees.cfm?StartRow=101&sn=z*'
    end

    it 'defaults to the first page_number' do
      BatchURL.new.url.must_equal 'https://www.nps.gov/directory/employees.cfm?StartRow=1&sn=a*'
    end


  end
end
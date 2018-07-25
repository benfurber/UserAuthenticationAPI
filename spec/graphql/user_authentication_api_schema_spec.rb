require 'rails_helper'

RSpec.describe UserAuthenticationAPISchema do
  let(:link_url) { 'http://www.facebook.com' }
  let(:link_description) { 'Facebook' }

  before do
    Link.create(url: link_url, description: link_description)
  end

  describe 'allLinks' do
    let(:query_model) { 'allLinks' }

    it 'returns ID' do
      query_content = 'id'
      query_string = %({ #{query_model} { #{query_content} } })
      result = described_class.execute(query_string)

      expect(result.as_json['data'][query_model]).not_to be_empty
    end

    it 'returns URLs' do
      query_content = 'url'
      query_string = %({ #{query_model} { #{query_content} } })
      result = described_class.execute(query_string)

      expect(result.as_json['data'][query_model]).to include(
        query_content => link_url
      )
    end

    it 'returns descriptions' do
      query_content = 'description'
      query_string = %({ #{query_model} { #{query_content} } })
      result = described_class.execute(query_string)

      expect(result.as_json['data'][query_model]).to include(
        query_content => link_description
      )
    end
  end
end

require 'rails_helper'

RSpec.describe UserAuthenticationAPISchema do
  let(:context) { {} }
  let(:variables) { {} }
  let(:result) {
    res = UserAuthenticationAPISchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    p res if res['errors']
    res
  }

  let(:link_url) { 'http://www.facebook.com' }
  let(:link_description) { 'Facebook' }

  before do
    Link.create(url: link_url, description: link_description)
  end

  describe 'a specific query' do
    let(:query_model) { 'allLinks' }
    let(:query_content) { 'url' }
    let(:query_string) { %|{ #{query_model} { #{query_content} } }| }
    let(:query_result) { result.as_json['data'][query_model] }

    it 'returns a result?' do
      expect(query_result).to include({ query_content => link_url })
    end
  end
end

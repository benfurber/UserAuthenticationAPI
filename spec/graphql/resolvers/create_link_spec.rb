require 'rails_helper'

RSpec.describe Resolvers::CreateLink, type: :model do
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  let(:test_url) { 'http://test.com/' }
  let(:test_description) { 'Testing init' }
  let(:link) do
    perform(
      url: test_url,
      description: test_description
    )
  end

  it 'can create a new link with a url' do
    link
    expect(link.url).to eq test_url
  end

  it 'can create a new link with a description' do
    link
    expect(link.description).to eq test_description
  end
end

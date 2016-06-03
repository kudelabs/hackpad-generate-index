require 'spec_helper'

describe Hackpad::Generate::Index do

  before(:each) do
    @api = Hackpad::Generate::Index::API.new(*load_test_config.values_at('site', 'client_id', 'secret'))
    @indexer = Hackpad::Generate::Index::Indexer.new(@api)
  end

  it 'has a version number' do
    expect(Hackpad::Generate::Index::VERSION).not_to be nil
  end

  it 'generate index page' do
    expect(@indexer.generate_page).not_to be nil
    @indexer.generate
    # expect(false).to eq(true)
  end
end

require 'spec_helper'

describe Bitshares::Client do

  let(:client) { Bitshares.testnet }

  # context 'configuration'

  context '#testnet' do
    it 'returns a Bitshares::Client' do
      expect(client.class).to eq Bitshares::Client
    end
  end

  context '#wallet' do
    it 'returns a Bithares::Wallet' do
      expect(client.wallet.class).to eq Bitshares::Wallet
    end
  end

  context '#market' do
    it 'returns a Bithares::Market' do
      expect(client.market('eur','usd').class).to eq Bitshares::Market
    end
  end

  context '#get_assets' do
    it 'gets the correct asset' do
      expect(client.asset('usd').first['symbol']).to eq 'USD'
    end
    it 'throws an error if asset not found' do
      expect(->{ client.asset('NOASSET') }).to raise_error Bitshares::Client::Err
    end
  end
end

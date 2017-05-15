require 'spec_helper'

describe Puppet::Type.type(:prometheus_rule) do
  let(:title) { 'test1' }

  let(:resource) { described_class.new(name: '/foo/bar') }

  describe 'key attributes' do
    let(:subject) { described_class.key_attributes }

    it 'contain only :name' do
      is_expected.to eq([:name])
    end
  end
end

require 'spec_helper'

describe 'prometheus::server', :type => :define do

  let(:title) do
    'test1'
  end

  let(:pre_condition) do
    "
      prometheus::rule{'default':
        prometheus_server => #{title},
      }

      prometheus::scrape_config{'default':
        prometheus_server => #{title},
      }

      define kubernetes::apply(
        $manifests,
      ){}
    "
  end

  let(:config) do
    catalogue.resource('Kubernetes::Apply', 'prometheus').send(:parameters)[:manifests][1]
  end

  context 'running on kubernetes master' do
    it do
      expect(config).to eq("")
    end
  end
end

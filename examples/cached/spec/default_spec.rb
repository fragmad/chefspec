require 'chefspec'
require 'chefspec/cacher'

RSpec.configure do |config|
  config.extend(ChefSpec::Cacher)
end

describe 'cached::default' do
  cached(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'does not raise an exception' do
    expect { chef_run }.to_not raise_error
  end
end

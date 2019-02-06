#
# Cookbook:: Elasticsearch
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'Elasticsearch::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updates all sources' do
      expect(chef_run).to update_apt_update('update')
    end
    
    it 'should install libxt-dev' do
      expect(chef_run).to install_package("libxt-dev")
    end

    it 'should install java' do
      expect(chef_run).to install_package("openjdk-8-jdk")
    end

    it "should install transport" do
      expect(chef_run).to install_package("apt-transport-https")
    end

    it 'should add the elastic stack to the sources list' do
      expect(chef_run).to run_bash('add-key')
    end

    it 'should run bash to wget the key for elastic stack' do
      expect(chef_run).to add_apt_repository('elasticsearch')
    end

    it "should install elasticsearch" do
      expect(chef_run).to install_package("elasticsearch")
    end

    it "should start the elasticsearch service" do
      expect(chef_run).to start_service("elasticsearch")
      expect(chef_run).to enable_service("elasticsearch")
    end

    it "should delete the existing /etc/elasticsearch/elasticsearch.yml" do
      expect(chef_run).to delete_file("/etc/elasticsearch/elasticsearch.yml")
    end
    it "should delete the existing /etc/elasticsearch/jvm.options" do
      expect(chef_run).to delete_file("/etc/elasticsearch/jvm.options")
    end

    it "Should create a elasticsearch.yml template in /etc/elasticsearch/elasticsearch.yml" do
      expect(chef_run).to create_template("/etc/elasticsearch/elasticsearch.yml")
    end

    it "Should create a jvm.options template in /etc/elasticsearch/jvm.options" do
      expect(chef_run).to create_template("/etc/elasticsearch/jvm.options")
    end
  end
end

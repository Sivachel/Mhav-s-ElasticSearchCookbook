# # encoding: utf-8

# Inspec test for recipe Elasticsearch::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe package("openjdk-8-jdk") do
  it { should be_installed }
end

describe package("apt-transport-https") do
  it { should be_installed }
end

describe bash("wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -") do
  its('exit_status') { should eq 0 }
end

describe package("elasticsearch") do
  it { should be_installed }
its('version') { should match /6.6\./ }
end

describe file("/etc/elasticsearch/elasticsearch.yml") do
  it { should exist }
end
describe file("/etc/elasticsearch/jvm.options") do
  it { should exist }
end

describe service("elasticsearch") do
  it { should be_enabled }
  it { should be_running }
end

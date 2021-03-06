# encoding: utf-8

title 'webserver infrastructure'

deployment_identifier = attribute('deployment_identifier', default: 'unknown', description: 'Which deployment_identifier to inspect')
component = attribute('component', description: 'Which component things should be tagged')
service = attribute('service', description: 'Which service things should be tagged')

describe aws_ec2_instance(name: "#{service}-#{component}-#{deployment_identifier}") do
  it { should be_running }
  its('tags') { should include(key: 'DeploymentIdentifier', value: deployment_identifier) }
  its('tags') { should include(key: 'Service', value: service) }
  its('tags') { should include(key: 'Component', value: component) }
  its('tags') { should include(key: 'ServerRole', value: 'webserver') }
end

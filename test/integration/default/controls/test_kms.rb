# frozen_string_literal: true

include_controls 'inspec-aws'
require './test/library/common'

tfstate = StateFileReader.new
key_id = tfstate.read['outputs']['kms']['value']['kms']['kms_key']['arn'].to_s
# role_name = tfstate.read['outputs']['kms']['value']['iam_service_linked_role']['name'].to_s

control 'default' do
  describe aws_kms_key(key_id: key_id) do
    # https://github.com/inspec/inspec-aws/blob/main/docs/resources/aws_kms_key.md
    it { should exist }
    it { should be_enabled }
    it { should_not be_external }
    it { should_not be_managed_by_aws }
    it { should_not have_key_expiration }
    it { should have_rotation_enabled }
    # TODO: - Determine the method for checking tags for this resource, since the way we're checking other resources isn't working. # rubocop:disable Layout/LineLength
    #         its('tags') { should include "t_dcl"=>"1", "t_cost_centre"=>"TEMPORARY", "t_environment"=>"DEV", "t_AppID"=>"SVC00000" } # rubocop:disable Layout/LineLength
  end

  # The default key no longer has a role attached to it, so this test is no longer valid.
  # describe aws_iam_role(role_name: role_name) do
  #   it { should exist }
  #   its('inline_policies.count') { should eq 0 }
  #   its('attached_policy_names') { should include 'AutoScalingServiceRolePolicy' }
  #   its('attached_policy_names.count') { should eq 1 }
  # end
end

require 'rails_helper'

describe 'Member Service' do
  it 'should make a successful post' do
    VCR.use_cassette( 'trelora_member_post' ) do
      member_email    = ENV['TRELORA_EMAIL']
      member_password = ENV['TRELORA_PASSWORD']

      member_auth = MembersService.new( member_email, member_password )

      expect(member_auth.success).to eq( "this_is_a_very_simple_auth_token_string" )
    end
  end
  it 'should make a failed post' do
    VCR.use_cassette( 'trelora_failed_member_post' ) do
      member_email    = ENV['TRELORA_EMAIL']
      member_password = 'wrong_password'

      member_auth = MembersService.new( member_email, member_password )

      expect(member_auth.success).to eq( false )
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'
require 'zoho/people/attendance'

RSpec.describe Zoho::People::Attendance do
  let(:email) { 'mckomo@gmail.com' }
  let(:check_in) { DateTime.parse('26/06/2017 10:00:00') }
  let(:check_out) { DateTime.parse('26/06/2017 18:00:00') }

  subject do
    described_class.new(email: email,
                        check_in: check_in,
                        check_out: check_out)
  end

  it 'can be casted to a string' do
    expect(subject.to_s).to eq('attendance from 2017-06-26@10:00 to 2017-06-26@18:00')
  end
end

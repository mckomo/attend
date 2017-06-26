# frozen_string_literal: true

require 'spec_helper'
require 'zoho/people/attendance'

RSpec.describe Zoho::People::Attendance do
  let(:check_in) { '26/06/2017 10:00:00' }
  let(:check_out) { '26/06/2017 18:00:00' }
  let(:email_id) { 'mckomo@gmail.com' }

  subject do
    described_class.new(check_in: check_in,
                        check_out: check_out,
                        email_id: email_id)
  end

  it 'has a check in' do
    expect(subject.check_in).to eq check_in
  end

  it 'has a check out' do
    expect(subject.check_out).to eq check_out
  end

  it 'has a email id' do
    expect(subject.email_id).to eq email_id
  end
end

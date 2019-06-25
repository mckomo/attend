# frozen_string_literal: true

require 'spec_helper'
require 'zoho/people/attendance_report/record'

RSpec.describe Zoho::People::AttendanceReport::Record do
  let(:date) { Date.new(2019, 6, 10) }
  let(:status) { 'Present' }

  subject do
    described_class.new(date: date, status: status)
  end

  describe '#missing_work?' do
    it 'returns false' do
      expect(subject.missing_work?).to be_falsey
    end

    context 'when status is "Absent"' do
      let(:status) { 'Absent' }

      it 'returns true' do
        expect(subject.missing_work?).to be_truthy
      end
    end

    context 'when status is empty' do
      let(:status) { '' }

      it 'returns true' do
        expect(subject.missing_work?).to be_truthy
      end
    end
  end
end

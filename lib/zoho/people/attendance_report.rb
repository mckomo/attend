# frozen_string_literal: true

require_relative './attendance_report/record'

module Zoho
  module People
    class AttendanceReport
      attr_reader :records

      def self.parse(data)
        records = data.map do |date, entry|
          Record.new(date: Date.parse(date), status: entry['Status'])
        end

        new(records)
      end

      def initialize(records)
        @records = records.sort_by(&:date)
      end
    end
  end
end

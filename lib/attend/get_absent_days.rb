# frozen_string_literal: true

module Attend
  class GetAbsentDays
    attr_reader :zoho

    def initialize(zoho:)
      @zoho = zoho
    end

    def call(email:, from:, to:)
      attendance_report = zoho.get_attendance_report(email: email, from: from, to: to)

      attendance_report.records.select(&:missing_work?).map(&:date)
    end
  end
end

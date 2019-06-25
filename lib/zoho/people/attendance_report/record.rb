# frozen_string_literal: true

module Zoho
  module People
    class AttendanceReport
      class Record
        attr_reader :date, :status

        def initialize(date:, status:)
          @date = date
          @status = status
        end

        def missing_work?
          status.empty? || status == 'Absent'
        end
      end
    end
  end
end

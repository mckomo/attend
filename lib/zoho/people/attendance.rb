# frozen_string_literal: true

module Zoho
  module People
    class Attendance
      attr_reader :check_in, :check_out, :email

      def initialize(email:, check_in:, check_out:)
        raise ArgumentError, 'check_in must be DateTime instance' unless check_in.is_a?(DateTime)
        raise ArgumentError, 'check_out must be DateTime instance' unless check_out.is_a?(DateTime)

        @email = email
        @check_in = check_in
        @check_out = check_out
      end

      def to_s
        "attendance from #{format(check_in)} to #{format(check_out)}"
      end

      private

      def format(datetime)
        datetime.strftime('%F@%H:%M')
      end
    end
  end
end
